
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const moment = require('moment-timezone');
const sendSMS = require("../../globals/sendSMS");


module.exports = {


  friendlyName: 'Update user profile while registering',


  description: '',


  inputs: {
     full_name :{
      type: 'string',
     },
    email_id :{
      type: 'string',
      description: 'Email address of an user',
      required :true,
      unique :true,
    },

    mobile_number :{
      type: 'string',
      required :true,
      unique :true,
    },

    country_code: {
      type: 'number',
      description: 'Country code',
      required :true,
    },

    birth_date_time :{
       type: 'ref', columnType: 'timestamp' 
    },

    birth_place :{
      type: 'string',
      //required :true,
    },


    timezone :{
       type: 'string',
    },
    
    latitude :{
      type: 'string',
    },

    longitude :{
      type: 'string',
    },




  },


  exits: {

  },


  fn: async function (inputs) {
   try {
           // let body = req.body
            if (utilities.validateInput(inputs.full_name) && utilities.validateInput(inputs.country_code)
                && utilities.validateInput(inputs.mobile_number) && utilities.validateInput(inputs.email_id)
                && utilities.validateEmail(inputs.email_id) && utilities.validateMobileNumber(inputs.mobile_number)
                && utilities.validateInput(inputs.birth_place) && utilities.validateInput(inputs.birth_date_time)
                && utilities.validateInput(inputs.latitude) && utilities.validateInput(inputs.longitude)
                && utilities.validateInput(inputs.timezone)) {

                let birthDate = moment(inputs.birth_date_time, "YYYY-MM-DD hh:mm A").tz(inputs.timezone).format("YYYY-MM-DD");
                let birthTime = moment(inputs.birth_date_time, "YYYY-MM-DD hh:mm A").tz(inputs.timezone).format("hh:mm A");
                console.log(birthDate);
                console.log(birthTime);

               let checkUser = await User.find({ mobile_number : inputs.mobile_number, country_code : inputs.country_code });
                  
                    // check user exists or not
                   if(checkUser.length > 0){
                   let queryStatus = await sails.sendNativeQuery('CALL updateUserProfileWhileRegister($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12 );' , [ inputs.full_name, inputs.country_code, inputs.mobile_number, inputs.email_id,
                        inputs.birth_place, new Date(inputs.birth_date_time), inputs.latitude, inputs.longitude, inputs.timezone, birthDate, birthTime, inputs.birth_address ]);
                   console.log(queryStatus.rows[0][0]);

                    if (queryStatus.rows[0][0] ) {
                            let otp = await sails.helpers.generateAndGetOtp(4);
                            let messageId = await sendSMS.sendOTPToUser(inputs.mobile_number, inputs.full_name, otp);
                            console.log(messageId);
                    }
                    else {
                        this.res.status(498).send({ status: false, data: queryStatus.rows[0].message })
                    }
                 }
                 else{
                      this.res.status(responseCode.ServerSuccess.Codes.USER_NOT_FOUND.success_code).send(responseCode.ServerSuccess.Codes.USER_NOT_FOUND);
                  }
            }
            else {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
        }
       

  
  catch (e) {
            console.error("Internal error:", e);
             this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }
      }

};
