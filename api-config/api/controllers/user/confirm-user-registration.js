
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

//const paymentGatewayObj = require("../helpers/paymentGateway");
//const paymentBAObj = require("../layers/businessLayer/paymentBA");

module.exports = {


  friendlyName: 'Confirm user registration',


  description: '',


  inputs: {
    user_id :{
      type: 'number' ,
      required : true
    },
   otp:{
      type: 'number',
      required : true
    },
    query_content :{
      type: 'string',
    },
    admin_id:{
      type:'number'
    }

  },


  exits: {

  },


  fn: async function (inputs) {


    // let payment = await sails.helpers.generatePaymentLinkForRegistration( 1, "I want this help");
    // console.log(payment);


         // Validations
     if (utilities.validateInput(inputs.user_id) && utilities.validateInput(inputs.otp) ){
     let userData =  await User.find({ id : inputs.user_id });
     let user = userData[0];
       //console.log(userData[0].registration_type);                                   

     if(userData && inputs.user_id){
        // verify user mobile number
        var userResult = await User.update({ id: inputs.user_id })
                  .set({
                    is_mobile_number_verified: 1,
                    mobile_verified_on : new Date()
                  });
        
       let userInformation = sails.sendNativeQuery('CALL profile-account-information($1) ;' [( inputs.user_id )] );           
       let query_content = inputs.query_content ? inputs.query_content : null;

       // create record in questions threads
       let threadData = await Questions_threads.create({ user_id : inputs.user_id , thread_type : userData[0].registration_type }).fetch();
       let thread_id = threadData.id ;

       // create record in question_conversations
       let conversationsData = await Question_conversations.create({ question_thread_id : thread_id , conversation_content  : inputs.query_content, written_by : inputs.user_id , user_type: 'USER' }).fetch();
       let conversation_id = conversationsData.id;

      
       // Check registration type

        if(userData[0].registration_type == 'FREE'){
            sails.log("Notification Sent");
        } 
         
        if (userData[0].registration_type == 'PAID' && userData[0].payment_status != 'captured') {
          // Check Admin Exists
          let adminData = await sails.sendNativeQuery('CALL checkAdminExists($1);', ([inputs.admin_id]) );
          if(adminData.rows[0].length > 0){

            let amount = await Registration_settings.find({ admin_id : inputs.admin_id }).populate('admin_id');
            //sails.log(amount[0].registration_amount);
            let payment = await sails.helpers.generatePaymentLinkForRegistration(user, amount[0].registration_amount, query_content);

            console.log(payment);
            //TODO CHECK PAYEMNT STATUS

           if (payment && payment.status) {
                 let gstAmount = (parseFloat(amount[0].registration_amount) * constants.GST_PERCENT / 100).toFixed(2);
                 let notes = inputs.query_content;
                 let obj = {
                  user_id: inputs.user_id,
                  conversation_thread_id: thread_id, chat_id: conversation_id,
                  amount: parseFloat(amount[0].registration_amount) - gstAmount, GST: gstAmount, total_amount: parseFloat(amount[0].registration_amount),
                  currency_code: amount[0].currency_code, currency_symbol: amount[0].currency_symbol, additional_notes: notes,
                  short_url: payment.resp.short_url, payment_relation_id: (payment.resp.id).substring(6), payment_link_id: payment.resp.id
              };

              console.log(obj);
           

            
          // await paymentBAObj.createNewPaymentForRegistrationBA(obj);
            let params = [obj.user_id, obj.conversation_thread_id, obj.chat_id,
                         obj.amount, obj.GST, obj.total_amount, obj.currency_code, obj.currency_symbol, 
                        obj.additional_notes, obj.short_url, obj.payment_relation_id, obj.payment_link_id, 'REGISTRATION'];
            let paymentResult = await sails.sendNativeQuery("CALL createNewPaymentForRegistration($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)", params);
            
            console.log(paymentResult);


            let data = {
                isPayment: true,
                payment: payment.resp
            }
           
            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: user , paymentData: data })
          }
          else {
            this.res.status(responseCode.ServerErrors.Codes.PAYMENT_NOT_CREATED.error_code).send(responseCode.ServerErrors.Codes.PAYMENT_NOT_CREATED)
          }
       }
    }
  }
}

}
};





// //https://api.razorpay.com/v1/payment_links
// {
//   status: true,
//   resp: {
//     accept_partial: false,
//     amount: 100,
//     amount_paid: 0,
//     callback_method: 'get',
//     callback_url: 'http://65.1.79.103:8000/profile?success=true',
//     cancelled_at: 0,
//     created_at: 1666711317,
//     currency: 'INR',
//     customer: {
//       contact: '+919871204026',
//       email: 'kritika09malhotra@yahoo.com',
//       name: 'Kritika'
//     },
//     description: 'sdsdsdsds',
//     expire_by: 0,
//     expired_at: 0,
//     first_min_partial_amount: 0,
//     id: 'plink_KY3IdR3ifKewPA',
//     notes: null,
//     notify: { email: false, sms: false, whatsapp: false },
//     payments: null,
//     reference_id: '',
//     reminder_enable: false,
//     reminders: [],
//     short_url: 'https://rzp.io/i/gF7R5ln6nT',
//     status: 'created',
//     updated_at: 1666711317,
//     upi_link: false,
//     user_id: ''
//   }
// }
