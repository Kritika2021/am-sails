const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");
const moment = require('moment');


module.exports = {


  friendlyName: 'Create payment',


  description: '',


  inputs: {
    user_id :{
      type:'number'
    },
    amount:{
      type:'ref',
      columnType:'double'
    },
    currency_code:{
      type:'string'
    },
    currency_symbol:{
      type:'string'
    },
    thread_id:{
      type:'ref',
      columnType:'integer'
    },
    additional_notes:{
      type:'ref',
      columnType:'varchar'
    },
    admin_id:{
      type:'ref',
      columnType:'integer'
    }

  },


  exits: {

  }, 


  fn: async function (inputs) {

   
        try {
            console.log("comes in try section");
            if (!(utilities.validateInputExist(inputs.user_id) && utilities.validateInputExist(inputs.amount) && utilities.validateInputExist(inputs.currency_code)
                && utilities.validateInputExist(inputs.currency_symbol) && utilities.validateInputExist(inputs.thread_id))) {

                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
            else {
                let userInfo = await User.find({ id : inputs.user_id });  
                let user = userInfo[0];

                console.log(userInfo[0]);
                
                // console.log(user.username);
                // console.log(user.country_code);
                // console.log(user.mobile_number);

                let notes = inputs.additional_notes ? inputs.additional_notes : null;
                console.log("notes" + notes);

                // TO DO Payment Link Generate
                let payment = await sails.helpers.generatePaymentLink(user.username, user.country_code, user.mobile_number,user.email_id, inputs.amount, notes, inputs.thread_id);
                //console.log(payment);

                if (payment && payment.status) {
                
                    //let conversation = await queryBAObj.addNewQueryConversationChatBA(inputs.thread_id, notes, inputs.admin_id, "ADMIN");
                   // let conversation = await sails.sendNativeQuery('CALL addNewQueryConversationChat($1, $2, $3, $4);', ([inputs.thread_id, notes, inputs.admin_id, "ADMIN"]) );
                    let conversation = await Question_conversations.create({
                                                                              question_thread_id    : inputs.thread_id, 
                                                                              conversation_content  : notes, 
                                                                              written_by :inputs.admin_id, 
                                                                              user_type  :inputs.admin_id  
                                                                          }).fetch();
                    console.log(conversation.id); 
                    let conversationId = conversation.id;
                    let gstAmount = (parseFloat(inputs.amount) * constants.GST_PERCENT / 100).toFixed(2);
                    let createPayment = await Payment_transaction.create({
                        user_id: inputs.user_id, admin_id: inputs.admin_id, conversation_thread_id: inputs.thread_id, chat_id: conversationId,
                        amount: parseFloat(inputs.amount) - gstAmount, GST: gstAmount, total_amount: parseFloat(inputs.amount),
                        currency_code: inputs.currency_code, currency_symbol: inputs.currency_symbol, additional_notes: notes,
                        short_url: payment.resp.short_url, payment_relation_id: (payment.resp.id).substring(6), payment_link_id: payment.resp.id
                    });


//                     {
//                     status: true,
//                     resp: {
//                       accept_partial: false,
//                       amount: 100,
//                       amount_paid: 0,
//                       callback_method: 'get',
//                       callback_url: 'http://65.1.79.103:8000/home?val=Y29uc3VtZXJfcXVlcnlfdGhyZWFkX2lkOjE=',
//                       cancelled_at: 0,
//                       created_at: 1680763046,
//                       currency: 'INR',
//                       customer: {
//                         contact: '+919871204026',
//                         email: 'welcomekritika@gmail.com',
//                         name: 'Kittu'
//                       },
//                       description: 'Test amount',
//                       expire_by: 0,
//                       expired_at: 0,
//                       first_min_partial_amount: 0,
//                       id: 'plink_LaPRBLgBnLuYbH',
//                       notes: null,
//                       notify: { email: true, sms: true, whatsapp: false },
//                       payments: null,
//                       reference_id: '',
//                       reminder_enable: false,
//                       reminders: [],
//                       short_url: 'https://rzp.io/i/8ppsSmdC',
//                       status: 'created',
//                       updated_at: 1680763046,
//                       upi_link: false,
//                       user_id: ''
//                     }
// }

                    // payment_relation_id : plink_LaPRBLgBnLuYbH  ( substring: LaPRBLgBnLuYbH )
                    // payment_link_id : plink_LaPRBLgBnLuYbH

                    // payment_id : LaPWXib8xLjzFF( when paymewnt is paid )

                    // when payment id 

                    // {
                    //     "id": "pay_LaPWXib8xLjzFF",
                    //     "entity": "payment",
                    //     "amount": 100,
                    //     "currency": "INR",
                    //     "status": "captured",
                    //     "order_id": "order_LaPW4X0ZaubM21",
                    //     "invoice_id": null,
                    //     "international": false,
                    //     "method": "upi",
                    //     "amount_refunded": 0,
                    //     "refund_status": null,
                    //     "captured": true,
                    //     "description": "#LaPRBLgBnLuYbH",
                    //     "card_id": null,
                    //     "bank": null,
                    //     "wallet": null,
                    //     "vpa": "success@razorpay",
                    //     "email": "void@razorpay.com",
                    //     "contact": "+919871204026",
                    //     "notes": [],
                    //     "fee": 2,
                    //     "tax": 0,
                    //     "error_code": null,
                    //     "error_description": null,
                    //     "error_source": null,
                    //     "error_step": null,
                    //     "error_reason": null,
                    //     "acquirer_data": {
                    //         "rrn": "619836907807",
                    //         "upi_transaction_id": "648562D6428B3D0B7FBFC998188987FB"
                    //     },
                    //     "created_at": 1680763350
                    // }

                 //payment_relation_id :  LaPRBLgBnLuYbH  LaPRBLgBnLuYbH

                    
                    //mail
                     //let userFirstQuery = await queryBAObj.getFirstQueryBA(body.threadId);//Getting users' first query.


                     // TODO
                     // let userFirstQuery = await sails.sendNativeQuery('CALL get_last_conversation($1)', [inputs.threadId] );

                     // console.log("User First Query ", userFirstQuery.rows[0].conversation_content); 

                     // Todo

                    // await emailSender.paymentCreate(user.username,user.email_id,body.amount,notes,userFirstQuery[0][0].conversation_content);

                    // await socket.adminPaymentSocket(body.threadId)
                    // notification
                    //await notificationsControllerObj.sendNotificationCreatePayment(body.threadId,user.username,body.amount,body.user_id)

                    // Notification

                     await sails.helpers.sendNotification.with({
                            title: constants.notifications_title.NEW_PAYMENT_CREATE_TO_USER,
                            message:"₹"+inputs.amount+constants.notifications_message.PAYMENT_MESSAGE,
                            from_user_id: 1,
                            to_user_id : 1,
                            chat_id:0,
                            unique_code: 110,//unique_code = from_user_id+""+to_user_id+""+chat_id
                            type: constants.notifications_title.NEW_PAYMENT_CREATE_TO_USER,
                          });



                    // Email 
                    await sails.helpers.paymentCreate(user.username,user.email_id,inputs.amount,notes,"conversation_content");



                    this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send(responseCode.ServerSuccess.Codes.SUCCESS)
                }
                else {
                    this.res.status(responseCode.ServerErrors.Codes.PAYMENT_NOT_CREATED.error_code).send(responseCode.ServerErrors.Codes.PAYMENT_NOT_CREATED)
                }
            }
        }
        catch (e) {
            console.error("error while creating payment link ======>", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR)
        }

}
};
