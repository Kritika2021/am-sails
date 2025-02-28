const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");


module.exports = {


  friendlyName: 'Create predefined message',


  description: '',


  inputs: {

   
    admin_id:{
      type:'number'
    },
    message_content:{
      type:'string'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

    try {
           
            if (utilities.validateInput(inputs.message_content)) {

                   let adminData = await Admin.find({ id : inputs.admin_id, is_deleted : 0 });
                   //console.log(adminData) ;

                   if(adminData.length > 0){ 

                      let findRecord = await Predefined_messages.find({message_content : inputs.message_content , is_deleted : 0 });
                      sails.log(findRecord);
                      if(findRecord.length < 0) {
                        sails.log("No Record Exists");
                       // this.res.status(responseCode.ServerErrors.Codes.MESSAGE_ALREADY_EXIST.error_code).send(responseCode.ServerErrors.Codes.MESSAGE_ALREADY_EXIST)
                      }
                      else if(findRecord.length > 0) {
                       // sails.log("No Record Exists");
                        this.res.status(responseCode.ServerErrors.Codes.MESSAGE_ALREADY_EXIST.error_code).send(responseCode.ServerErrors.Codes.MESSAGE_ALREADY_EXIST)
                      }
                      else{
                        //insert record
                        let record = await Predefined_messages.create({admin_id : inputs.admin_id, message_content: inputs.message_content}).fetch();
                        this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true , message: "Successfully Executed"});
                      }
                  }
                  else {
                    this.res.status(responseCode.ServerErrors.Codes.ADMIN_NOT_FOUND.error_code).send(responseCode.ServerErrors.Codes.ADMIN_NOT_FOUND);
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