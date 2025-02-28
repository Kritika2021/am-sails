const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");
const axios = require('axios').default;
const moment = require('moment');
const moment_timezone = require('moment-timezone');


module.exports = {


  friendlyName: 'Check payment status',


  description: '',


  inputs: {
    plink_id:{
      type:'ref',
      columnType:'varchar'

    },
    payment_id:{
      type:'string'
    },
    signature:{
      type:'string'
    }

  },


  exits: {

  },


  fn: async function (inputs) {
//&&  utilities.validateInputExist(inputs.signature
            try {
            //let reqData = req.body;
            if (utilities.validateInput(inputs.plink_id) && utilities.validateInput(inputs.payment_id)) 
            {
                let paymentStatus = await Payment_transaction.find({ payment_link_id : inputs.plink_id });
                if(paymentStatus.payment_status == 'captured')
                {
                    this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: { updateUI: false}});
                }
                else
                {
                    let username = sails.config.custom.TEST.USER_NAME, 
                    password = sails.config.custom.TEST.PASSWORD;
                  
                    let url = "https://" + username + ':' + password + "@api.razorpay.com/v1/payments/" + inputs.payment_id;
                    console.log(url);

                    let resp = await axios.get(url);
                    console.log('dzxcvczsfdvbdxdfc_109', resp.data);
                    let relationId = (resp.data.description).substring(1);
                  
                   // Update Payment Code
                    let data = await Payment_transaction.find({ payment_relation_id : relationId });
                    console.log(data[0]);


                    if(data[0].payment_status == 'captured'){
                     console.log("Payment made success");
                    }else{
                        let updateData = await Payment_transaction.update({ payment_relation_id : relationId })
                                                                  .set({ payment_id : resp.data.id, order_id : resp.data.order_id, 
                                                                         payment_method : resp.data.method, payment_status : resp.data.status, 
                                                                         paid_on : moment().format("dd/mm/yyyy") });

                    }

                    if(data[0].payment_for == "REGISTRATION"){
                         let updateData = await User.update({ id : data[0].user_id })
                                                                  .set({ payment_status : resp.data.status });
                    }

                    // End of Update Payment

                    // Get User Query Information
                   let query = " SELECT * FROM payment_transaction pt JOIN user u ON(u.id = pt.user_id) WHERE pt.payment_relation_id = $1";
                   let userInfo = await sails.sendNativeQuery(query, [relationId]);
                   console.log(userInfo.rows[0]);
                   // End User Info

                   if(userInfo.rows[0] && userInfo.rows[0].length > 0){
                            if(resp.data.status.toUpperCase() == constants.PAYMENT_STATUS.CAPTURE){
                              
                                // Check Thread
                               if(userInfo.rows[0].payment_for == 'THREAD'){
                                   let message = "Payment of " + userInfo.rows[0].currency_symbol + userInfo.rows[0].total_amount+ " received with transaction id #"+relationId +" via "+ userInfo.rows[0].payment_method.toUpperCase()+" on " + moment_timezone().format("DD MMM YYYY");
                                   console.log("Message" + message);
                               }
                            }
                                      
                             if (data[0].isPaymentCaptureRepeating == 1){

                              console.log("Notification Sent");
         
                              // let systemMessage = await queryBAObj.addNewQueryConversationChatBA(userInfo[0].conversation_thread_id,message, userInfo[0].user_id, "SYSTEM")
                              // emailSender.sendPaymentSuccess(userInfo[0].username, userInfo[0].email_id, userInfo[0].currency_symbol + userInfo[0].total_amount, '#' + relationId, resp.data.method.toUpperCase());
                              // //socket is not calling
                              // socket.userPaymentCompleteSocket(userInfo[0].conversation_thread_id,systemMessage)
                              // // notification
                              // notificationsControllerObj.sendNotificationUserCompletePayment(userInfo[0].conversation_thread_id, userInfo[0].user_id,userInfo[0].total_amount,userInfo[0].username)
                            }
                   }else if(userInfo.rows[0].payment_for == 'REGISTRATION'){
                        let userFirstQuery = await queryBAObj.getFirstQueryByuserIdBA(userInfo.rows[0].user_id);
                        if(userFirstQuery[0][0].conversation_content){

                          console.log("Notification Sent");

                            // //socket
                            // socket.getThreadDeatilForSocket(userFirstQuery[0][0].question_thread_id)
                            // // notification
                            // notificationsControllerObj.newPaidUserCreateNotifications(userFirstQuery[0][0].question_thread_id, userFirstQuery[0][0].user_id,userFirstQuery[0][0].conversation_content,userInfo[0].username)
                        }
                }else if(resp.data.status.toUpperCase() == constants.PAYMENT_STATUS.FAILED){

                    console.log("Status Failed");
                
                 }
                  this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: { updateUI: true }});
            }
        }
    
      
            else {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
        } // end of try  
        catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
