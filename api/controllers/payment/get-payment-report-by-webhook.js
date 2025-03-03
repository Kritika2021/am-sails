const moment = require('moment-timezone');
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants"); 

module.exports = {


  friendlyName: 'Get payment report by webhook',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs) {
      try {
            let body = this.req.body;
            let report = body.payload.payment.entity;
            let relationId = (report.description).substring(1);
            let isPaymentCaptureRepeating = 1;
            
            let obj = {
                payment_method: report.method,
                payment_status: report.status,
                payment_id: report.id,
                order_id: report.order_id,
                payment_relation_id: relationId
            };
            // 1. let data = await paymentBAObj.updatePaymentReportBA(obj);

            /* Sails Code */
            let data = await Payment_Transaction.find({ payment_relation_id : inputs.payment_relation_id });
            console.log(data);
            if(data.payment_status == 'captured'){

                isPaymentCaptureRepeating = 0;

            }else{
              let updateRecord = await Payment_transaction.update({payment_relation_id : relationId })
                                                          .set({ payment_id : report.id , order_id : report.order_id, 
                                                                  payment_method : report.method, payment_status : report.status, 
                                                                  paid_on : new Date() }); 
            }

            if(payment_for == "REGISTRATION"){
              let updateData = await User.update({id : data.userId }).set({ payment_status : report.status });
            }
            console.log("Successfully Generated");

      // 2.   let userInfo = await paymentBAObj.getUserInfoWithPaymentRelationIdBA(relationId);

      |     
            let params = relationId;
            let query = "SELECT * FROM payment_transaction pt JOIN user u ON(u.user_id = pt.user_id) WHERE pt.payment_relation_id = ?";
            let userInfo = sails.sendNativeQuery(query, ([relationId]) );
            console.log(userInfo);

             if(userInfo && userInfo.length > 0){
                if(report.status.toUpperCase() == constants.PAYMENT_STATUS.CAPTURE){
                    let message = "Payment of " + userInfo[0].currency_symbol + userInfo[0].total_amount+ " received with transaction id #"+relationId +" via "+ userInfo[0].payment_method.toUpperCase()+" on " + moment_timezone().format("DD MMM YYYY");
                    if(userInfo[0].payment_for == 'THREAD'){
                        if (isPaymentCaptureRepeating == 1){
                           // let systemMessage = await queryBAObj.addNewQueryConversationChatBA(userInfo[0].conversation_thread_id,message, userInfo[0].user_id, "SYSTEM")
   
                        let params = [userInfo[0].conversation_thread_id, message, userInfo[0].user_id, "SYSTEM"];
                        sails.sendNativeQuery("CALL addNewQueryConversationChat(?,?,?,?)", params)
                          
                         // my new added line
                            
                        // To do // notification
                        // notificationsControllerObj.sendNotificationUserCompletePayment(userInfo[0].conversation_thread_id, userInfo[0].user_id,userInfo[0].total_amount,userInfo[0].username)
                        }
                    }
                    else if(userInfo[0].payment_for == 'REGISTRATION'){
                        let userFirstQuery = await queryBAObj.getFirstQueryByuserIdBA(userInfo[0].user_id);
                        if (data[0][0].isPaymentCaptureRepeating == 1){
                            await queryBAObj.addNewQueryConversationChatBA(userInfo[0].conversation_thread_id,message, userInfo[0].user_id, "SYSTEM");
                           
                        let params = [userInfo[0].conversation_thread_id, message, userInfo[0].user_id, "SYSTEM"];
                        sails.sendNativeQuery("CALL addNewQueryConversationChat(?,?,?,?)", params)

                            /// To do / notification
                            // notificationsControllerObj.newPaidUserCreateNotifications(userFirstQuery[0][0].question_thread_id, userFirstQuery[0][0].user_id,userFirstQuery[0][0].conversation_content,userInfo[0].username)
                         }
                    }
                }else if(report.status.toUpperCase() == constants.PAYMENT_STATUS.FAILED){
                    // if(userInfo[0].payment_for == 'REGISTRATION'){
                    //     let sessionKey = userInfo[0].user_id + "_user_session";
                    //     let sessionId = await utilities.encryptSession(sessionKey);
                    //     await redisClient.del(sessionId);
                    }
                }
            
            this.res.status(200).send(true)
        }
        catch (e) {
            console.error('PAYMET_CONTROLLER_102', e);
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR)
        }
      }

  


};
