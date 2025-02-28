const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");

module.exports = {


  friendlyName: 'Admin conversation user profile',


  description: '',


  inputs: {

    user_id:{
      type:'ref',
      columnType:'integer'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

  try {
            if (utilities.validateInput(inputs.user_id) && utilities.validateNumber(inputs.user_id)) {

                let userData = await User.find( {id : inputs.user_id} );
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, user: userData });
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
