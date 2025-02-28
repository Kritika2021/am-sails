const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants"); 
const moment = require('moment');

module.exports = {


  friendlyName: 'Add new query conversation chat by admin',


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
    },
    admin_id:{
        type:'number'
    }
  },


  exits: {

  },
 

  fn: async function (inputs) {

     try {  

        this.req.file('file').upload(async function (err, uploadedFiles) {
      
        if (!(utilities.validateInputExist(inputs.thread_id) && (utilities.validateInputExist(inputs.query_content) || utilities.validateInputExist(uploadedFiles[0].filename)))) 
        {
           this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
        }

        if (uploadedFiles[0].filename && uploadedFiles[0].filename.length >  0 ) 
        {

          let conversation_media  = sails.config.AWS_S3_CONFIG.conversation_media;
          console.log("CM" , conversation_media);


          let mediaData = await sails.helpers.uploadImageOrPdfFile(uploadedFiles, inputs.admin_id, conversation_media);

               let data =  Questions_threads.find({ id : inputs.thread_id });

               //if(inputs.user_id == data.user_id){ 
               if(inputs.user_id == 1) // Testing
               {
                   let qcData =  Question_conversations.create({ question_thread_id : inputs.thread_id,
                                                                 conversation_content : inputs.query_content,
                                                                 user_id : inputs.user_id   
                                                              }).fetch();
                  // console.log(qcData.id);
                   let conversationId = 1; // Testing

                   if (mediaData && mediaData.media_url) 
                   {

                    await Conversation_media.create({ conversation_id : conversationId , media_url: mediaData.media_url, media_type: mediaData.media_type, media_subtype: mediaData.media_subtype, added_by : inputs.admin_id, user_type : "ADMIN", created_on : moment().format('YYYY-MM-DD HH:mm:ss'),
                                                      file_name : mediaData.filename, file_size : mediaData.fileSize }).fetch();
                   }

               }


              let userFirstQuery = sails.sendNativeQuery('CALL get_last_conversation($1);', ([inputs.thread_id]) );

              /*
                SELECT qc.*,qt.user_id FROM question_conversations qc 
                join questions_threads qt on (qc.question_thread_id = qt.id)
                where qc.question_thread_id = question_thread
                order by qc.created_on asc limit 1 ;
              */



              let userInformation = sails.sendNativeQuery('CALL admin_conversation_mail($1);', ([inputs.thread_id]) );
               console.log(userFirstQuery);

              //   //await emailSender.adminConversationMail(body.query_content, userInformation[0][0].username, userInformation[0][0].email_id, mediaData.media_url, mediaData.filename, fileType,userFirstQuery[0][0].conversation_content);
                //await socket.addNewQueryConversationChatByAdminSocket(body.threadId,conversationId);   

                

                if(utilities.validateFieldData(inputs.query_content)){

                   //console.log( "After validation Query COntent ", inputs.query_content);

                    //await notificationsControllerObj.NewMessageCreatedFromAdmin(body.threadId,userFirstQuery[0][0].user_id,userFirstQuery[0][0].user_type,body.query_content)
                    await sails.helpers.sendNotification.with({
                                                                title: 'Notification Title',
                                                                message:inputs.query_content,
                                                                from_user_id: 1,
                                                                to_user_id : inputs.user_id,
                                                                chat_id:0,
                                                                unique_code: 110 , //from_user_id+""+to_user_id+""+chat_id,
                                                                type: "NewMessageCreatedFromAdmin"
                                                              });
                    console.log("Notification created");
                    //this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send(responseCode.ServerSuccess.Codes.SUCCESS)
                 }
                 else{
                   //await notificationsControllerObj.NewMessageCreatedFromAdminAttachment(body.threadId,userFirstQuery[0][0].user_id,userFirstQuery[0][0].user_type,body.query_content)
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

});

 

 }catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR)
        }

}
};
