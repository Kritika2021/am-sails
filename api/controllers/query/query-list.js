const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");


module.exports = {


  friendlyName: 'Query list',


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
            let search_text = inputs.search_text;
            let page = inputs.page;

            if (utilities.validateInput(inputs.search_text)) {
                search_text = "%" + inputs.search_text + "%"
            }
            else {
                search_text = null;
            }
            if (!utilities.validateInput(page)) {
                page = 1
            }
            let filter =(inputs.filter)? inputs.filter : "ALL";

            let offset_value = (page - 1) * constants.pageConstants.pageLength;
            let queryList = await sails.sendNativeQuery('CALL getUserQueryList($1, $2, $3, $4);', ([search_text, filter, constants.pageConstants.pageLength, offset_value,inputs.user_id]) );
            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: queryList.rows[0] });
        }
        catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
