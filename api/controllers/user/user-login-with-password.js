
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");


module.exports = {


  friendlyName: 'User login with password',


  description: '',


  inputs: {

   mobile_number:{
    type:'ref',
    columnType:'integer'
   },

   password:{
    type:'string'
   }

  },


  exits: {

  },


  fn: async function (inputs) {

    try {
           
            if (utilities.validateInput(inputs.mobile_number) && utilities.validateInput(inputs.password)) {
                let consumer = await User.find({ mobile_number : inputs.mobile_number })

                 if (consumer.length > 0) {
            //      sails.log(consumer[0].username);
            //      sails.log(consumer[0].password);
                     if(consumer[0].registration_type == 'PAID' && consumer[0].payment_status != 'captured'){
                         this.res.status(responseCode.ServerErrors.Codes.USER_NOT_FOUND.error_code).send(responseCode.ServerErrors.Codes.USER_NOT_FOUND);
                     }else{
                         if(consumer[0].password){
                             let comparePasswordResult = await utilities.comparePassword(inputs.password, consumer[0].password)
                              console.log(comparePasswordResult);
                
                              if (comparePasswordResult) {

                                sails.log("Login Successfull , Password Match");
                             //     consumer = consumer[0][0]
                             //     delete consumer["password"];
            //                     let sessionKey = consumer.user_id + "_user_session";
            //                     let sessionId = await utilities.encryptSession(sessionKey);
            //                     await redisClient.set(sessionId, JSON.stringify(consumer));
            //                     consumer.sessionId = sessionId;
            //                     //FCM
            //                     await loginBA.userUpdateFCMtokenBA(reqData.fcm_token,consumer.user_id)
                                 this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: consumer });
                            }
                            else {
                                this.res.status(responseCode.ServerErrors.Codes.PASSWORD_NOT_MATCHING.error_code).send(responseCode.ServerErrors.Codes.PASSWORD_NOT_MATCHING);
                            }
                        }
                        else {
                            this.res.status(responseCode.ServerErrors.Codes.PASSWORD_NOT_AVAILABLE.error_code).send(responseCode.ServerErrors.Codes.PASSWORD_NOT_AVAILABLE);
                        }
                    }
                }  // Consumer end
                else {
                    this.res.status(responseCode.ServerErrors.Codes.USER_NOT_FOUND.error_code).send(responseCode.ServerErrors.Codes.USER_NOT_FOUND);
                }
            } // End of Validation
            else {
                res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
        }catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }
  }


};
