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

               // let adminData = await sails.sendNativeQuery('CALL checkAdminExists($1);', ([inputs.admin_id]) );
                let adminData = await Admin.find({ id :inputs.admin_id, is_deleted : 0 });

                //let rulesData = await sails.sendNativeQuery('CALL checkRuleExists($1);', ([inputs.rules_id]) );
                let rulesData = await Rules.find({ id: inputs.rules_id });

                if(adminData.length > 0 && rulesData.length > 0){ 
                    //await sails.sendNativeQuery('CALL delete_rules($1, $2);', ([ inputs.rules_id, inputs.admin_id ]))
                    let updateRuleMsg = await Rules_messages.update({ fk_rules_id : inputs.rules_id}).set({is_deleted : 1, deleted_on : new Date(), deleted_by : inputs.admin_id });
                    let updateRuleTag = await Rules_tag.update({ fk_rules_id : inputs.rules_id}).set({is_deleted : 1, deleted_on : new Date(), deleted_by : inputs.admin_id });
                    let updateRule    = await Rules.update({ id : inputs.rules_id}).set({is_deleted : 1, deleted_on : new Date(), deleted_by : inputs.admin_id });

                    this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ dataRuleMSg : updateRuleMsg, dataRuleTag : updateRuleTag, dataRule : updateRule,status: true });
               }else{
                    console.log("Admin or Rule id not exists");
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
