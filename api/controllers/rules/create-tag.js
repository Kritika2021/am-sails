const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Create tag',


  description: '',


  inputs: {
    tagContent :{
      type:'string'
    },
    admin_id:{
      type:'ref',
      columnType:'integer'
    }


  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            if (utilities.validateInput(inputs.tagContent)) {
                let findResult = await Tags.find({ tag_content : inputs.tagContent , is_deleted : 0 });
                 if(findResult.length == 0){

                   //let adminData = await sails.sendNativeQuery('CALL checkAdminExists($1);', ([inputs.admin_id]) );
                   //SELECT * FROM admin WHERE id = admin_id AND is_deleted = "0";
                   let adminData = await Admin.find({ id: inputs.admin_id, is_deleted : 0 });

                   if(adminData.length > 0){ 
                     let tagRecord = await Tags.create({ admin_id : inputs.admin_id , tag_content : inputs.tagContent }).fetch();
                     this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ data: tagRecord , status: true });
                   }
                   else {
                    this.res.status(responseCode.ServerErrors.Codes.ADMIN_NOT_FOUND.error_code).send(responseCode.ServerErrors.Codes.ADMIN_NOT_FOUND);
                  }
                }
                else {
                   this.res.status(responseCode.ServerErrors.Codes.TAG_ALREADY_EXIST.error_code).send(responseCode.ServerErrors.Codes.TAG_ALREADY_EXIST)
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
