
const responseCode = require("../globals/apiResponse");
const utilities = require("../globals/utilities");
const constants = require("../globals/constants"); 
 

module.exports = {


  friendlyName: 'File uploader',


  description: '',


  inputs: {

    images:{
        type:'ref',
        columnType:'blob'
    },
    id:{
        type:'number'
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

        let s3Bucket = utilities.getS3BucketInstance();
        console.log("id" + inputs.id);
        // outputBuffer contains JPEG image data no wider than 200 pixels and no higher
        // than 200 pixels regardless of the inputBuffer image dimensions
        let uniqueFileName = inputs.id + "_" + new Date().toISOString() + ".jpg";
        let serverTarget = "https://" + sails.config.AWS_S3_CONFIG.bucket + ".s3.amazonaws.com/";
        let path;
        let params = {Key: uniqueFileName, ContentType: "image/jpg", Body: ''};
        path = sails.config.AWS_S3_CONFIG.MAIN_FOLDER(1) + "/" + inputs.folder + "/";
        params.Key = path + uniqueFileName;
        let AWS_Image_Path = serverTarget + path + uniqueFileName;
        s3Bucket.putObject(params, function (err, data) {

            //return { url : AWS_Image_Path };

            // if(err){
            //    return reject(err);
            // }
            // else {
            //     return resolve({AWS_Image_Path});
            // }
        });

        return { url:AWS_Image_Path };
            
    }

  };

