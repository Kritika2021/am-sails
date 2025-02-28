const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");


module.exports = {


  friendlyName: 'Delete predefined messages',


  description: '',


  inputs: {
    messageId :{
      type:'number'
    },
    admin_id:{
      type:'number'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            if (utilities.validateInput(inputs.messageId)) {
            let adminData = await sails.sendNativeQuery('CALL checkAdminExists($1);', ([inputs.admin_id]) );
            if(adminData.rows[0].length){ 

                let deleteResult = await sails.sendNativeQuery('CALL delete_predefined_message($1, $2);', ( [inputs.messageId, inputs.admin_id] ) );
                //sails.log(deleteResult.rows);

                if (deleteResult) {
                    this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });
                }
                else {
                    this.res.status(responseCode.ServerErrors.Codes.MESSAGE_IS_IN_USE.error_code).send(responseCode.ServerErrors.Codes.MESSAGE_IS_IN_USE)
                }
            }
            else {
                    this.res.status(responseCode.ServerErrors.Codes.ADMIN_NOT_FOUND.error_code).send(responseCode.ServerErrors.Codes.ADMIN_NOT_FOUND);
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
