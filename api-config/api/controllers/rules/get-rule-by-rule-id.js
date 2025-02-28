const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");


module.exports = {


  friendlyName: 'Get rule by rule id',


  description: '',


  inputs: {
    
  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            let params = this.req.allParams();
            sails.log(params);
            if (utilities.validateInputExist(params.ruleid)) {
                let rulesData = await sails.sendNativeQuery('CALL getRulesByRuleId($1);', ([params.ruleid]) );
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: rulesData.rows[0] });
            } else {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
        } catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
