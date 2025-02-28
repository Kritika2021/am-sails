const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants"); 

module.exports = {


  friendlyName: 'Read users conversation by user of query thread',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs) {
    try {
            let params = this.req.allParams();
            let threadId = params.id;

            //await queryBA.readUsersConversationByUserOfQueryThreadBA(threadId,"ADMIN");

            await Question_conversations.update({ question_thread_id : threadId , user_type : { in: ['ADMIN', 'SYSTEM'] } })
                                        .set({ is_read : 1 , read_on : now() });

            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send(responseCode.ServerSuccess.Codes.CONVERSATION_READ_SUCCESSFULLY)
        }
        catch (e) {
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR)
        }
  }


};
