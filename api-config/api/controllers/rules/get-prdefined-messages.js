
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Get prdefined messages',


  description: '',


  inputs: {
    search_text:{
      type:'string'
    },
    page:{
      type:'number'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

    try {
           
            if (utilities.validateInput(inputs.search_text)) {
                inputs.search_text = "%" + inputs.search_text + "%"
            }
            else {
                inputs.search_text = null;
            }
            if (!utilities.validateInput(inputs.page)) {
                inputs.page = 1
            }
            let offset_value = (inputs.page - 1) * constants.pageConstants.pageLength;
            let PredefinedMessage = await sails.sendNativeQuery('CALL get_predefined_messages ($1, $2, $3);', ([inputs.search_text, constants.pageConstants.pageLength, offset_value]) );
            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: PredefinedMessage.rows[0] });
        }
        catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
