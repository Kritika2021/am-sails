const utilities = require("../../globals/utilities");
const responseCode = require("../../globals/apiResponse");

module.exports = {


  friendlyName: 'Profile update save changes',


  description: '',


  inputs: {

     username :{
      type: 'string',
     },

     email_id :{
      type: 'string',
      description: 'Email address of an user',
      required :true,
      unique :true,
    },

    password: {
      type : 'string',
    },

    user_id :{
      type: 'number'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

    try {
           
            if (utilities.validateInput(inputs.username) && utilities.validateInput(inputs.email_id)
                && utilities.validateEmail(inputs.email_id)) {
                if (utilities.validateInput(inputs.password)) {
                    if (utilities.validatePassword(inputs.password)) 
                    {

                        let encryptPassword = await sails.helpers.encryptPassword(inputs.password);
                        sails.log(encryptPassword); 

                      
                        let queryStatus = await sails.sendNativeQuery('call profileUpdateSaveChanges($1, $2, $3, $4);' , [inputs.username, inputs.email_id, inputs.user_id, inputs.password ]);
                        this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });
                    }
                    else {
                        this.res.status(responseCode.ServerErrors.Codes.INVALID_PASSWORD_LENGTH.error_code).send(responseCode.ServerErrors.Codes.INVALID_PASSWORD_LENGTH);
                    }
                }
                else {

                    let queryStatus = sails.sendNativeQuery('call profileUpdateSaveChanges($1, $2, $3, $4);' , [inputs.username, inputs.email_id, inputs.user_id, null ]);
                    this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });
                }
              }
              else {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD);
              } 
               
        }
        catch (e) {
            console.error("Internal error ", e);
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }
  }


};
