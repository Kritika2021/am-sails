
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants"); 


module.exports = {


  friendlyName: 'Get sent and received attachments',


  description: '',


  inputs: {

    thread_id:{
      type : 'ref',
      columnType:'integer'
    },
    user_types:{
      type:'string',
    },



  },


  exits: {

  },


  fn: async function (inputs) {
        try {
           // let reqData = req.body;
            if (utilities.validateInput(inputs.thread_id) && utilities.validateNumber(inputs.thread_id)
                && utilities.validateInputExist(inputs.user_types) && inputs.user_types == constants.userTypes.ADMIN || inputs.user_types == constants.userTypes.USER) {

                let sentAndReceivedAttachments = await sails.sendNativeQuery('CALL getSentAndReceivedAttachments($1, $2);', ([inputs.thread_id, inputs.user_types]) );
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: sentAndReceivedAttachments.rows[0] });

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
