const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const sendSMS = require("../../globals/sendSMS");

module.exports = {


  friendlyName: 'Login using otp',


  description: '',


  inputs: {
    country_code:{
      type: 'string',
    },

    mobile_number:{
      type:'ref',
      columnType:'integer'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

   try { 
         // TODO Validation
         console.log(inputs.mobile_number);

     if (utilities.validateInput(inputs.country_code) && utilities.validateInput(inputs.mobile_number)) {
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
                                          mobile_verified_on: new Date()
                                        });
          
              let query = await User.find({ country_code : inputs.country_code, mobile_number : inputs.mobile_number });

              // Check Registration type 
                if (user.length > 0) {

                  console.log(user[0].registration_type);

                    if(user[0].registration_type == 'PAID' && user[0].payment_status != 'captured'){
                        this.res.status(responseCode.ServerSuccess.Codes.USER_NOT_FOUND.success_code).send(responseCode.ServerSuccess.Codes.USER_NOT_FOUND);
                    }else{
                            let otp = await sails.helpers.generateAndGetOtp(4);
                            console.log(otp);
                            let messageId = await sendSMS.sendOTPToUser(inputs.mobile_number, user[0].username, otp);
                            console.log("message Id" +messageId);
                    }
                }
                else {
                    this.res.status(responseCode.ServerSuccess.Codes.USER_NOT_FOUND.success_code).send(responseCode.ServerSuccess.Codes.USER_NOT_FOUND);
                }
            
          }
          else{
              this.res.status(responseCode.ServerSuccess.Codes.USER_NOT_FOUND.success_code).send(responseCode.ServerSuccess.Codes.USER_NOT_FOUND);
          }
        }
        if(user.fieldCount){
            console.log("Query Succesfully executed");
        }
      } else {
          this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
      }
    }
      catch (e) {
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }
}// end of function


};
