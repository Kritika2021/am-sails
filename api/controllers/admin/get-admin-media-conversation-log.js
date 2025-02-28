const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");


module.exports = {


  friendlyName: 'Get admin media conversation log',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            let adminId = inputs.adminId;
            if (!(utilities.validateInputExist(adminId))) {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
            else {
                let page = params.page ? parseInt(params.page) : constants.pageConstants.defaultPage;
                let offset = (page - 1) * constants.pageConstants.pageLength;
                let conversationLog = await sails.sendNativeQuery('CALL get_admin_conversation_media_log($1, $2, $3);', [ adminId, constants.pageConstants.pageLength, offset ]);
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: conversationLog.rows });
            }
        }
        catch (e) {
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
