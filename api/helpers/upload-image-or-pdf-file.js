const responseCode = require("../globals/apiResponse");
const utilities = require("../globals/utilities");
const constants = require("../globals/constants");
const fs = require('fs'); 

module.exports = {


  friendlyName: 'Upload image or pdf file',


  description: '',


  inputs: {

    file :{
      type:'ref',
      columnType:'blob'
    },
    user_id:{
      type:'ref',
      columnType:'integer'
    },
    folder:{
      type:'string'
    }

  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs) {


console.log(inputs.user_id);

   // files, userId, folder
        let s3Bucket = utilities.getS3BucketInstance();
        //let file = files[0];
        let originalFileName = inputs.file[0].filename;
        let fileSize = Math.round(inputs.file[0].size / constants.FILE_SIZE); // CONVERTING INTO KB
        let [filename, extension] = originalFileName.split('.').reduce((acc, val, i, arr) => (i == arr.length - 1) ? [acc[0].substring(1), val] : [[acc[0], val].join('.')], []);
        let fileUrl = await new Promise((resolve, reject) => {
            let fileStream = fs.createReadStream(inputs.file[0].fd);
            let uniqueFileName = inputs.user_id + "_" + new Date().toISOString() + "."+extension;
            let serverTarget = "https://" + sails.config.AWS_S3_CONFIG.bucket + ".s3.amazonaws.com/";
            let path;
            let content = extension.toLowerCase() == "pdf" ? 'application/pdf' : "image/jpg";
            let params = {Key: uniqueFileName, ContentType:content, Body: fileStream};
            path = sails.config.AWS_S3_CONFIG.MAIN_FOLDER(1) + "/" + inputs.folder + "/";
            params.Key = path + uniqueFileName;
            let AWS_Image_Path = serverTarget + path + uniqueFileName;
            s3Bucket.putObject(params, function (err, data) {
                if(err){
                    return reject(err);
                }
                else {
                    return resolve({url:AWS_Image_Path});
                }
            });
        });
        let fileType = extension.toLowerCase() == "pdf" ? "PDF" : "IMAGE";
        console.log(fileUrl.url);

        return {media_url:fileUrl.url, filename:originalFileName, media_type:fileType, media_subtype:extension, fileSize:fileSize+' KB'}
  }


};

