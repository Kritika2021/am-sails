const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");

module.exports = {


  friendlyName: 'First time password set',


  description: '',


  inputs: {
      password: {
      type : 'string',
    },
    user_id:{
      type: 'number'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            if (utilities.validateInput(inputs.password)) {
            
                let encryptPassword = await sails.helpers.encryptPassword(inputs.password);
               
                let queryStatus = await  sails.sendNativeQuery('CALL firstTimePasswordSet($1, $2);' , [ inputs.password, inputs.user_id ])
               // sails.log(queryStatus.affectedRows);
                if(queryStatus.affectedRows){
                   this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });
                }
            }
            else {
                  this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD);
            }
        }
        catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
