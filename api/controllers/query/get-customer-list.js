
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Get customer list',


  description: '',


  inputs: {
    search_text:{
      type:'string'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            //let body = req.body;
            let params = this.req.allParams();
           // let page = params.page;

            let search = utilities.validateInput(inputs.search_text) ? "%" + inputs.search_text + "%" : null;
            let page = params.page ? parseInt(params.page) : constants.pageConstants.defaultPage;
            let offset_value = (page - 1) * constants.pageConstants.pageLength;
            let customerList = await sails.sendNativeQuery('CALL get_customer_list($1, $2, $3);', ([search, constants.pageConstants.pageLength, offset_value]) );
            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: customerList.rows[0] });
        }
        catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }
    

  }


};
