const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");

module.exports = {


  friendlyName: 'Get all user attachments',


  description: '',


  inputs: {

    thread_id:{
      type:'ref',
      columnType:'integer'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

     try {
             //let reqData = req.body;
             if (utilities.validateInput(inputs.thread_id) && utilities.validateNumber(inputs.thread_id)) {
               //let allAttachments = await queryBA.getAllUserAttachmentsBA(reqData.thread_id);
                 var getAttachmentsData = await sails.sendNativeQuery('CALL user_all_attachments($1)', ([inputs.thread_id]) );

                // console.log(getAttachmentsData);
                 this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: getAttachmentsData.rows[0] });

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
