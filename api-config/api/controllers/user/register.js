const moment = require('moment-timezone');
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const sendSMS = require("../../globals/sendSMS");



module.exports = {


  friendlyName: 'Register',


  description: 'Register user.',


  inputs: {

    full_name :{
      type: 'string',
     },

    username :{
      type: 'string',
      description: 'The name of user',
      required :true,
      unique :true,
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

    password : {
      type: 'string',
      //required :true,
    },

    country_code: {
      type: 'string',
      description: 'Country code',
      required :true,
    },

    is_mobile_number_verified :{
      type: 'boolean', defaultsTo: false,
    },

    is_email_verified :{
      type: 'boolean', defaultsTo: false,
    },

    is_locked :{
      type: 'boolean', defaultsTo: false,
    },

    birth_date_time :{
       type: 'ref', columnType: 'timestamp' 
    },

    birth_date :{
      type: 'string',
      //required :true,
    },

    birth_time :{
      type: 'string',
    },

    birth_place :{
      type: 'string',
      //required :true,
    },

    birth_address :{
      type: 'string',
      //required :true,
    },

    registered_on :{
       type: 'ref', columnType: 'timestamp' 
    },

    profile_pic :{
       type: 'string' ,
       //columnType:'blob'
    },

    gender :{
        type: 'string',
        isIn: [ 'M', 'F' ]
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

    mobile_verified_on :{
       type: 'ref', columnType: 'timestamp' 
    },

    registration_type :{
      type: 'string',
      isIn: [ 'FREE', 'PAID' ]
    },

    payment_status :{
      type: 'string',
    },

    payment_relation_id :{
      type : 'string', 
    },

    locked_by :{
      type: 'number',
      columnType : 'bigint'
    },

    fcm_token :{
      type : 'string'
    },
    
    otpValue:{
      type: 'ref',
      columnType:'integer'
    },
    is_admin:{
      type: 'boolean', defaultsTo : false
    },


  },


  exits: {

  },


  fn: async function (inputs) {
    if ( 
         utilities.validateInput(inputs.full_name) && utilities.validateInput(inputs.country_code) 
          && utilities.validateInput(inputs.mobile_number) && utilities.validateEmail(inputs.email_id) 
          && utilities.validateMobileNumber(inputs.mobile_number)&& utilities.validateInput(inputs.email_id)
          && utilities.validateInput(inputs.birth_place) && utilities.validateInput(inputs.birth_date_time)
          && utilities.validateInput(inputs.latitude) && utilities.validateInput(inputs.longitude)
          && utilities.validateInput(inputs.timezone) 
          //&& utilities.validateInput(inputs.registrationType) 

       ) {

    // Data collect and insert into Database
      
      let birth = moment(inputs.birth_date_time).tz(inputs.timezone).format();
      let birthDate = moment(birth).tz(inputs.timezone).format("YYYY-MM-DD");
      let birthTime = moment(birth).tz(inputs.timezone).format("hh:mm A");

      let userFind = await User.find({ 
                                       or : [
                                        { mobile_number : inputs.mobile_number },
                                        { email_id       : inputs.email_id },
                                        { username       : inputs.username },
                                      ]
                                    });

      if(userFind.length > 0){
        this.res.status(responseCode.ServerErrors.Codes.USER_ALREADY_EXIST.error_code).send(responseCode.ServerErrors.Codes.USER_ALREADY_EXIST)
      }
      else{
          let user = await User.create({ username : inputs.username, password : inputs.password , full_name : inputs.full_name , country_code : inputs.country_code, 
                                                 mobile_number : inputs.mobile_number, email_id : inputs.email_id, 
                                                 birth_place : inputs.birth_place, 
                                                 birth_date_time : birth, latitude : inputs.latitude,
                                                 longitude : inputs.longitude,
                                                 timezone : inputs.timezone, birthDate : birthDate, birthTime : birthTime, 
                                                 registration_type : inputs.registrationType, birth_address : inputs.birth_address , is_admin : 0
                                              }).fetch();
          sails.log("User Created" , user);


       
          if(user){
            let otp = await sails.helpers.generateAndGetOtp(4);
            let messageId = await sendSMS.sendOTPToUser(inputs.mobile_number, inputs.full_name, otp);
            sails.log("messageId " + messageId);
            if(messageId){
              //await User.update({ country_code : inputs.country_code, mobile_number : inputs.mobile_number }).set(otpValue : otp);
              this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: user });
            }
            else{
              //await User.update({ country_code : inputs.country_code, mobile_number : inputs.mobile_number }).set(otpValue : '9898');
              this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: user });
            }
            
          }
      }
    
    

    //this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: otp });

    //console.log(data);
  }

  }


};
