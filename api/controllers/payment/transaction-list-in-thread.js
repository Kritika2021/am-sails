const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Transaction list in thread',


  description: '',


  inputs: {

    thread_id:{
      type:'ref',
      columnType:'integer'
    },


  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            
            if (utilities.validateInput(inputs.thread_id) && !(isNaN(inputs.thread_id))){
                let result = await sails.sendNativeQuery('CALL transaction_list_in_thread($1);', ([inputs.thread_id]) );

                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true,data:result.rows[0] });
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
