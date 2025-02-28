const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const sendSMS = require("../../globals/sendSMS");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Otp verification',


  description: '',


  inputs: {
    otp:{
      type:'number'
    },
    country_code:{
      type:'number'
    },
    mobile_number:{
      type:'number'
    },
    user_id:{
      type:'number'
    }
  },


  exits: {

  },


  fn: async function (inputs) {
     try {
            if (utilities.validateInput(inputs.otp) && utilities.validateInput(inputs.country_code) && utilities.validateInput(inputs.mobile_number) && utilities.validateInput(inputs.user_id)) {
                let otpData = await Otp.find({ user_id : inputs.user_id , status : constants.STATUS_ACTIVE });
                //console.log(otpData.length);

                if (otpData.length > 0) {
                    let utcCreatedDate = otpData[0].utcCreatedDate;
                    
                    let utcExpiryDate = new Date(otpData[0].utcExpiryDate);
                    console.log(utcExpiryDate);
                    const currentDate = new Date();
                    console.log(currentDate);

                    if( (utcExpiryDate.getTime() === currentDate.getTime() )   ||  ( utcExpiryDate.getTime() > currentDate.getTime() ) ){
                       if(inputs.otp == otpData[0].otp_value){
                            console.log("OTP verified");

                            // Make status expired
                            let updateStatus = await Otp.update({ id: user[0].id })
                                                            .set({
                                                              status: constants.STATUS_EXPIRED,
                                                            });

                            let user = await  User.find({ country_code : inputs.country_code, mobile_number : inputs.mobile_number });
                            console.log(user.length);
                            if(user.length > 0)
                            {
                              console.log(user[0].id);
                              if( user[0].id != null && ( user[0].is_mobile_number_verified == 0 ) )
                              {
                                //console.log("Comes under if");
                                let updateQuery = await User.update({ id: user[0].id })
                                                            .set({
                                                              is_mobile_number_verified:'1',
                                                              mobile_verified_on: new Date(),
                                                            });
                              
                                let query = await User.find({ country_code : inputs.country_code, mobile_number : inputs.mobile_number });
                                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: user });
                              }
                            }
                        }else{
                           //console.log("OTP MISMATCHED");
                           this.res.status(responseCode.ServerErrors.Codes.INVALID_OTP.error_code).send(responseCode.ServerErrors.Codes.INVALID_OTP)
                        }
                    }
                    else{
                        console.log("Date expired");
                        // new OTP Regenerate 
                    }
                }    
                else {
                    console.log("Expired OTP ");
                    this.res.status(responseCode.ServerErrors.Codes.INVALID_OTP.error_code).send(responseCode.ServerErrors.Codes.INVALID_OTP)
                    //this.res.status(responseCode.ServerSuccess.Codes.USER_NOT_FOUND.success_code).send(responseCode.ServerSuccess.Codes.USER_NOT_FOUND);
                  }
            }
            else {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
        }
        catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
