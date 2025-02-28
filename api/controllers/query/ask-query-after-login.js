const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");

module.exports = {


  friendlyName: 'Ask query after login',


  description: '',


  inputs: {

    query_content:{
      type:'string',
      defaultsTo:'Test Content'
    },
    user_id:{
      type:'ref',
      columnType:'integer'
    },
    // createdAt: { type: 'ref', columnType: 'datetime', autoCreatedAt: true, },
    // updatedAt: { type: 'ref' , columnType: 'datetime', autoUpdatedAt: true, },



  },


  exits: {

  },


  fn: async function (inputs) {

      try {
            
            if (utilities.validateInput(inputs.query_content)) {

                var createdQuestionThread = await Questions_threads.create({   user_id:inputs.user_id,
                                                      thread_type : 'FREE',
                                                       }).fetch();
                //sails.log("insert" , createdQuestionThread);
                let threadId = createdQuestionThread.id;
                //sails.log("insert" , threadId);

                var createdQuestionConversation = await Question_conversations.create({ question_thread_id:threadId,
                                                                                        conversation_content : inputs.query_content,
                                                                                        written_by : inputs.from_user_id,
                                                                                        user_type  : 'USER',
                                                                                     }).fetch();
                //sails.log("insert" , createdQuestionConversation);
                let conversationId = createdQuestionThread.id;
                //sails.log("insert" , conversationId);

                if (threadId && conversationId ) {
                    // await socket.askQueryAfterLoginSocket(queryResult[0][0].threadId)
                    // // notification

                    await sails.helpers.sendNotification.with({
                          title: 'Title',
                          message:'MESSAGE',
                          from_user_id: inputs.from_user_id,
                          to_user_id : inputs.user_id,
                          chat_id:0,
                          unique_code: inputs.from_user_id+""+inputs.user_id+""+0,
                          type:"Ask Query After Login"
                        });
                    // await notificationsControllerObj.sendNotificationNewMessageToAdmin(queryResult[0][0],req.username,queryResult[0][0].query_content)
                     this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true});
                }
                else {
                    this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
                }
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
