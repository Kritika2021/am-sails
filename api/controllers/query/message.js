const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants"); 

module.exports = {


  friendlyName: 'Message file upload',


  description: '',


  inputs: {
    admin_id:{
      type:'number'
    },
    thread_id:{
      type:'number'
    },
    file:{
      type:'ref',
      columnType:'blob'
    },
    user_type:{
      type: 'string',
      
    },
    query_content:{
      type:'string'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

     try {  
         let id = inputs.admin_id;

         this.req.file('file').upload(async function (err, uploadedFiles) {
          console.log(uploadedFiles[0]);

            if (utilities.validateInput(inputs.thread_id) && utilities.validateInput(inputs.admin_id)) {
                //let images = formValue.files.image;
                console.log(uploadedFiles[0].filename.length);

                if (uploadedFiles[0].filename && uploadedFiles[0].filename.length > 0) 
                 {
                    let pic = await sails.helpers.fileUploader(uploadedFiles[0].filename, id, sails.config.AWS_S3_CONFIG.conversation_media);
                    console.log(pic.url);
                    let media_url = pic && pic.url ? pic.url : null;
                
                    
                      let qcData = await Question_conversations.create({ conversation_content : inputs.query_content,
                                                                         question_thread_id : inputs.thread_id,
                                                                         written_by : inputs.admin_id,
                                                                         user_type: inputs.user_type  
                                                                      }).fetch();

                      console.log(qcData);

                      if (qcData) 
                        console.log(qcData.id);
                         // this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });
                     
                    if( media_url != null ) 
                    {
                      let cmData =  await Conversation_media.create({ conversation_id: qcData.id,
                                                        media_url : media_url ,
                                                        media_type : 'IMAGE',
                                                        media_subtype : 'JPEG',
                                                        user_type : inputs.user_type
                                                      }).fetch();

                      console.log(cmData);
                     }
                }
            }
            else {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
        });
       }catch (e) {
            console.error('upload profile pic error ', e);
            //responseSenderObj.sendResponseToClient(res, false, responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code, responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
