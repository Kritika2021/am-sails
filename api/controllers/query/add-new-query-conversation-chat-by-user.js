const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants"); 
const moment = require('moment');

module.exports = {


  friendlyName: 'Add new query conversation chat by user',


  description: '',


  inputs: {
    user_id:{
      type:'number'
    },
    thread_id:{
      type:'number'
    },
    query_content:{
      type:'string'
    },
    file:{
      type:'ref',
      columnType:'blob'
    }
  },


  exits: {

  },

  fn: async function (inputs) {

  try {  

   this.req.file('file').upload(async function (err, uploadedFiles) {

   // console.log(uploadedFiles);

    console.log(inputs.thread_id);
    console.log(inputs.user_id);
    console.log(uploadedFiles[0].filename);

    if (!(utilities.validateInputExist(inputs.thread_id) && (utilities.validateInputExist(inputs.query_content) || utilities.validateInputExist(uploadedFiles[0].filename)))) 
    {
       this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
    }

   

    if (uploadedFiles[0].filename) 
    {
        let mediaData = await sails.helpers.uploadImageOrPdfFile(uploadedFiles, inputs.user_id, sails.config.AWS_S3_CONFIG.conversation_media);
        console.log(mediaData);
    

       let data = Questions_threads.find({ id : inputs.thread_id });
       //console.log(data.user_id);
       //if(inputs.user_id == data.user_id)
       if(inputs.user_id == 1) // Testing
       {
        let qcData = Question_conversations.create({ question_thread_id : inputs.thread_id,
                                                       conversation_content : inputs.query_content,
                                                       user_id : inputs.user_id   
                                                    }).fetch();
       

     //console.log(qcData.id);
       let conversationId = 1; // Testing
       if(conversationId){
                if (mediaData && mediaData.media_url) {
                    //await queryBA.addMediaToConversationChatBA(conversationId, mediaData.media_url, mediaData.media_type, mediaData.media_subtype, req.user_id, "USER", mediaData.filename, mediaData.fileSize)
                    
                    //Converted
                    let cmData = await Conversation_media.create({ conversation_id : conversationId , media_url: mediaData.media_url, media_type: mediaData.media_type, media_subtype: mediaData.media_subtype, added_by : inputs.user_id, user_type : "USER", created_on : moment().format('YYYY-MM-DD HH:mm:ss'), 
                                                                    file_name : mediaData.filename, file_size : mediaData.fileSize }).fetch();
                    console.log(cmData);

               }
        }

      if(utilities.validateFieldData(inputs.query_content)){
      //await notificationsControllerObj.NewMessageCreatedFromUser(body.threadId,req.user_id,req.username,body.query_content)
      await sails.helpers.sendNotification.with({
        title: 'Notification Title',
        message:constants.notifications_message.NEW_MESSAGE_FROM_USER,
        from_user_id: 1,
        to_user_id : 1,
        chat_id:0,
        unique_code: 110 , //from_user_id+""+to_user_id+""+chat_id,
        type: "NewMessageCreatedFromUser"
      });
      this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send(responseCode.ServerSuccess.Codes.SUCCESS)
      }
      else{
         //await notificationsControllerObj.NewMessageCreatedFromUserAttachment(body.threadId,req.user_id,req.username)
          await sails.helpers.sendNotification.with({
          title: 'Notification Title',
          message:  constants.notifications_message.ATTACHMENT,
          from_user_id: inputs.user_id , // user id
          to_user_id : 1, // admin
          chat_id: 0,
          unique_code: 110,//from_user_id+""+to_user_id+""+chat_id,
          type:constants.notify_about.ATTACHMENT_NOTIFY
         // user_type: req.admin_id
       });

          
         this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send(responseCode.ServerSuccess.Codes.SUCCESS)
      }  
    }
    else {
        this.res.status(responseCode.ServerErrors.Codes.INVALID_THREAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_THREAD)
    }
  }
});

}// end of try
catch (e) {
    console.error("error ===============>", e)
    this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR)
}
 
}

};
