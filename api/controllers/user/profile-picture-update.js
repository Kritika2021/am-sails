const multiparty = require('multiparty');
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");
//const sharp = require('sharp');

module.exports = {


  friendlyName: 'Profile picture update',


  description: '',


  inputs: {

    file:{
      type:'ref',
      columnType:'blob'

    },
    user_id:{
      type:'number',
    },

  },


  exits: {

  },


  fn: async function (inputs) {

      try {
     
                   let mediaData = await sails.helpers.fileUploader(inputs.file, inputs.user_id, sails.config.AWS_S3_CONFIG.user_profile_pic);
                    if (mediaData && mediaData.url) {
                    await User.update({ id : inputs.user_id }).set({ profile_pic : mediaData.url });
                     this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send(responseCode.ServerSuccess.Codes.SUCCESS)
                   }
                
            
        }
        catch (e) {
            console.error("error ===============>", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR)
        }

}
};
