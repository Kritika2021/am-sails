const sendSMS = require("../../globals/sendSMS");
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const moment=require('moment');



module.exports = {


  friendlyName: 'Resend otp',


  description: '',


  inputs: {
    
    mobile_number:{
      type : 'number'
    },
   
    country_code:{
      type: 'ref',
      columnType:'integer'
    }

  },


  exits: {

  },


  fn: async function (inputs) {
      
      try {
       

            if (utilities.validateInput(inputs.country_code) && utilities.validateInput(inputs.mobile_number)) {

                //let redisKey = inputs.country_code + "-" + inputs.mobile_number; 
                let otp = await sails.helpers.generateAndGetOtp(4);
                sails.log("OTP", otp);

                let user = await User.find({ country_code : inputs.country_code , mobile_number : inputs.mobile_number });
                //sails.log(user); 

                    if (user){
                        let messageId = await sendSMS.sendOTPToUser(inputs.mobile_number, user[0].username, otp);
                        if(messageId){
                            // create OTP LOGs

                            const dt = new Date();
                            let createdDateTime = dt.toISOString();
                            
                            // After 2 Hours 
                            dt.setHours(dt.getHours() + 2);
                            let updateDateTime =  dt.toISOString();
                          
                            let otpLog = await Otp.create({ user_id : user[0].id , is_active : true , utcCreatedDate :  createdDateTime , utcExpiryDate : updateDateTime, status:'Active', otp_value : otp , mobile_number : inputs.mobile_number, country_code: inputs.country_code }).fetch();
                            console.log(otpLog);

                            if(otpLog){
                                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });
                            }
                        }
                       // await redisClient.setex(redisKey, constants.OTP_STORE_TIME_LIMIT, JSON.stringify({otp: otp}));
                       // this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });
                    }
                else {
                   this.res.status(responseCode.ServerErrors.Codes.USER_NOT_EXIST.error_code).send(responseCode.ServerErrors.Codes.USER_NOT_EXIST);
                }
            }
            else {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
        }
        catch (e) {
            console.log("error->",e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
