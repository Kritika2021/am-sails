const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");

module.exports = {


  friendlyName: 'Ask question without login',


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
      description: 'Contact number of user',
      required :true,
    },

    
    country_code: {
      type: 'string',
      description: 'Country code`',
      required :true,
    },

    birth_date_time :{
       type: 'ref', columnType: 'datetime' 
    },

    birth_place :{
      type: 'string',
      required :true,
    },

    query_content :{
      type: 'string',
      required :true,
    },

    timezone :{
       type: 'string',
    },
    
    latitude :{
      type: 'string',
    },

    longitude :{
      type: 'string',
    }

  },


  exits: {

  },


  fn: async function (inputs) {
        try {
                if (utilities.validateInput(inputs.full_name) && utilities.validateInput(inputs.country_code)
                    && utilities.validateInput(inputs.mobile_number) && utilities.validateInput(inputs.email_id)
                    && utilities.validateEmail(inputs.email_id) && utilities.validateMobileNumber(inputs.mobile_number)
                    && utilities.validateInput(inputs.birth_place) && utilities.validateInput(inputs.birth_date_time)
                    && utilities.validateInput(inputs.query_content) && utilities.validateInput(inputs.latitude)
                    && utilities.validateInput(inputs.longitude) && utilities.validateInput(inputs.timezone)) 
                
                {
                  let queryStatus = await  sails.sendNativeQuery('CALL ask_query_before_sign_up($1, $2, $3, $4, $5, $6, $7, $8, $9, $10 );' , 
                                                                  [ inputs.full_name, inputs.country_code, inputs.mobile_number, inputs.email_id, inputs.birth_place, inputs.birth_date_time, inputs.query_content, inputs.latitude, inputs.longitude, inputs.timezone] );

                  console.log(queryStatus.rows[0]);
                  
                  if(queryStatus.affectedRows){
                      this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: queryStatus.rows[0] });
                  }
                      
                }
                else {
                   // sails.log("Error in query Executed");
                      this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
                  }

            }
            catch (e) {
              //sails.log("Error in query Executed");
               this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
            }
  }


};
