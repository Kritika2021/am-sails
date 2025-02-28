const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants"); 


module.exports = {


  friendlyName: 'Message conversation',


  description: '',


  inputs: {

    thread_id:{
        type:'number'
    },
    page:{
        type:'number'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

     try {
           // let reqData = req.body;
            if (utilities.validateInput(inputs.thread_id) && utilities.validateNumber(inputs.thread_id)) {
                if (!utilities.validateInput(inputs.page)) {
                    inputs.page = 1
                }
                let offset_value = (inputs.page - 1) * constants.pageConstants.pageLength;
                let conversations = await sails.sendNativeQuery('CALL admin_message_conversation($1, $2, $3);' , ([inputs.thread_id, constants.pageConstants.pageLength, offset_value]) );
                let list = conversations.rows[0];
                console.log(list);

                 //To do
                  
                const forLoop = async _ => {
                    for (let index = 0; index < list.length; index++) {
                        //list[index].media = await queryBA.getMediaForConversationBA(list[index].conversation_id);
                        list[index].media = await Conversation_media.find({ id : list[index].conversation_id , is_deleted : 0 });

                    }
                }
                //SELECT * FROM conversation_media WHERE conversation_id = c_id AND is_deleted = 0;
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: list });
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
