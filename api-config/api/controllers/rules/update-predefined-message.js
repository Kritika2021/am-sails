const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Update predefined message',


  description: '',


  inputs: {

    messageId:{
      type:'number'
    },
    message_content:{
      type:'string'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            if (utilities.validateInput(inputs.message_content) && utilities.validateInput(inputs.messageId)) {
                let updateResult = await sails.sendNativeQuery('CALL edit_predefined_messages($1, $2);' , ( [inputs.message_content, inputs.messageId] ));
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true , message: "Updated Succesfully"});
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
