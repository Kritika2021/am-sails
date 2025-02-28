
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Get message by tags',


  description: '',


  inputs: {
    tagList:{
      type:'string'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

    try {
           
            if (inputs.tagList.length == 0) {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
            else {
                //let messages = await rulesBA.getMessageByTagsBA(inputs.tagList.toString());
                let query = "SELECT pm.id,pm.message_content " +
                            "FROM rules r " +
                            "JOIN rules_messages rm ON (rm.fk_rules_id = r.id and rm.is_deleted = 0) " +
                            "JOIN predefined_messages pm ON (pm.id = rm.fk_message_id and pm.is_deleted = 0) " +
                            "JOIN rules_tag rt ON (rt.fk_rules_id = r.id and rt.is_deleted = 0) " +
                            "WHERE rt.fk_tag_id IN ($1) " +
                            "ORDER BY pm.id;";
                let params = [1,2,3,4,5];
                let messages = await sails.sendNativeQuery(query, params);
                console.log(messages);


                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: messages })
            }
        }
        catch (e) {
            console.error("error =======> ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
