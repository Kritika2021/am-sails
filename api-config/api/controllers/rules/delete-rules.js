const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");



module.exports = {


  friendlyName: 'Delete rules',


  description: '',


  inputs: {
    rules_id:{
      type:'number'
    },
    admin_id:{
      type:'number'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

     try {
            
            if (utilities.validateInputExist(inputs.rules_id)) {

                let adminData = await sails.sendNativeQuery('CALL checkAdminExists($1);', ([inputs.admin_id]) );
                let rulesData = await sails.sendNativeQuery('CALL checkRuleExists($1);', ([inputs.rules_id]) );
                if(adminData.rows[0].length > 0 && rulesData.rows[0].length > 0){ 
                    await sails.sendNativeQuery('CALL delete_rules($1, $2);', ([ inputs.rules_id, inputs.admin_id ]))
                    this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });
               }else{
                    console.log("Admin or Rue id not exists");
               }
            } else {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }

        } catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
