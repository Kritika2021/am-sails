
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants"); 


module.exports = {


  friendlyName: 'Get user conversation by query thread',


  description: '',


  inputs: {

    user_id:{
        type:'ref',
        columnType:'integer'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

      try {
            let params = this.req.allParams();
            let threadId = params.id ;
            

            if (!(utilities.validateInputExist(params.id))) {
                console.log(threadId);
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
            else {
                let page = params.page ? parseInt(params.page) : constants.pageConstants.defaultPage;
                let offset = (page - 1) * constants.pageConstants.pageLength;
                let userConversation = await sails.sendNativeQuery('CALL getUserConversationByQueryThread($1, $2, $3, $4);', ([inputs.user_id, threadId, constants.pageConstants.pageLength, offset] ) );
                
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: userConversation.rows[0] });
            }
        }
        catch (e) {
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }


  }


};
