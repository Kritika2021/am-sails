const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Refund amount',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs) {

     try {
            let params = this.req.allParams();
            let paymentTransId = params.id
            if (!(utilities.validateInputExist(paymentTransId))) {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
            else {
                
                 let query = await Payment_transaction.find({ id : paymentTransId });

                let paymentInfo = query[0];
                console.log("paymentInfo",paymentInfo.payment_id);
                 if (paymentInfo && paymentInfo.payment_status && paymentInfo.payment_status.toUpperCase() == constants.PAYMENT_STATUS.CAPTURE) {
                     if (!paymentInfo.refund_id) {

                        console.log("comes inside");


                            let paymentId = paymentInfo.payment_id;
                            let total_amount =  paymentInfo.total_amount;

                            console.log("sdsd", paymentId);
                            console.log("dsdsd", total_amount);


                           let refund = await sails.helpers.refundAmountToUser(paymentId, total_amount).intercept('noDataFound', ()=>{
                                                                                                                              return new Error('No Data');
                                                                                                                            });;
                           console.log("My refund ID", refund.id);
                           
                //         let updated = await paymentBAObj.refundAmountUpdateInfoBA(paymentTransId, refund.id, refund.entity,paymentInfo.total_amount);
                         
                           let updated = await Payment_transaction.update({ id : paymentTransId }).set({ refund_id : refund.id, 
                                                                                                         refund_entity : refund.entity, 
                                                                                                         refund_amount : paymentInfo.amount, 
                                                                                                         refund_On : moment().format("dd/mm/yyyy") }).fetch();

              
                           let userInfo = await User.find({ id : paymentInfo.user_id });
                           console.log(userInfo.rows[0]);

                           let refundId = (refund.id).substring(5);
                           console.log("RefundId " + refundId);

                           // EMAIL 
                //         emailSender.refundStatus(userInfo[0].username,userInfo[0].email_id,"#"+refundId, paymentInfo.currency_symbol,paymentInfo.total_amount,moment_timezone().format("DD MMM YYYY"),"#"+paymentInfo.payment_relation_id);

                           sails.helpers.refundStatus(userInfo.rows[0].username,userInfo.rows[0].email_id,"#"+refundId, paymentInfo.currency_symbol,paymentInfo.total_amount,moment_timezone().format("DD MMM YYYY"),"#"+paymentInfo.payment_relation_id)


                           let message = "Refunded Rs ₹" +paymentInfo.total_amount + " on "+ moment_timezone().format("DD MMM YYYY")+", payment will be received in next 8-10 working days.";
                           console.log(message);

                          // let systemMessage = await queryBAObj.addNewQueryConversationChatBA(paymentInfo.conversation_thread_id,message, paymentInfo.user_id, "SYSTEM")
                            

                //         socket.userRefundAmountSocket(paymentInfo.conversation_thread_id,systemMessage[0][0].conversationId)
                //         notificationsControllerObj.userRefundAmount(paymentInfo.total_amount,moment_timezone().format("DD MMM YYYY"),paymentInfo.user_id)
                           

                           await sails.helpers.sendNotification.with({
                                  title: constants.notifications_title.REFUND_RS+paymentInfo.amount+" on "+refundDate+",",
                                  message:  constants.notifications_message.REFUND_MESSAGE,
                                  from_user_id: paymentInfo.user_id , // user id
                                  to_user_id : 1, // admin
                                  chat_id: 0,
                                  unique_code: 110,//from_user_id+""+to_user_id+""+chat_id,
                                  type:constants.notify_about.REFUND_AMOUNT
                                 // user_type: req.admin_id
                                 });

                        
                        this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: updated })
                    }
                    else {
                        this.res.status(responseCode.ServerErrors.Codes.REFUND_ALREADY_DONE.error_code).send(responseCode.ServerErrors.Codes.REFUND_ALREADY_DONE)
                    }
                }
                else {
                    this.res.status(responseCode.ServerErrors.Codes.PAYMENT_PENDING.error_code).send(responseCode.ServerErrors.Codes.PAYMENT_PENDING)
                }
            }
        }
   
        catch (e) {
            console.error("=========eeeeee>", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR)
        }

  }


};
