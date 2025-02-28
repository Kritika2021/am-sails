const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");

module.exports = {


  friendlyName: 'Get admin conversation media log',


  description: '',


  inputs: {
  
  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            let params = this.req.allParams();
            let adminId = params.adminId;
            sails.log(adminId); 
            if (!(utilities.validateInputExist(adminId))) {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
            else {
                let page = params.page ? parseInt(params.page) : 1;
                let offset = (page - 1) * 20;
                let conversationLog = await sails.sendNativeQuery('CALL get_admin_conversation_media_log($1, $2, $3)', [adminId, 20, offset] );
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: conversationLog.rows[0] });
            }
        }
        catch (e) {
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }
    
  }


};
