const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Create rules',


  description: '',


  inputs: {
    rules_name:{
      type:'string'
    },
    admin_id:{
      type:'ref',
      columnType:'integer'
    },
    tagList:{
      type:{}
    },
    messageList:{
      type:{}
    }

  },


  exits: {

  },


  fn: async function (inputs) {
  try{
      if (utilities.validateInputExist(inputs.rules_name)) {// && body.tagList.length > 0 && body.messageList.length > 0) {
        
        let rules = await Rules.create({ rules_name : inputs.rules_name , admin_id : inputs.admin_id }).fetch();
        //console.log(rules.id);

        if(rules.id){
        let ruleMsgQuery = "Insert into rules_messages (fk_rules_id, fk_message_id, added_by) values ?";
            let params = [];
            await messageList.map(message => {
                params.push([rules.id, message.messageId, inputs.admin_id]);
            });
        await sails.sendNativeQuery(ruleMsgQuery , [params] );


        let tagQuery = "Insert into rules_tag (fk_rules_id, fk_tag_id, added_by) values ?";
            let tagParams = [];
            await tagList.map(tag => { 
                tagParams.push([rulesId, tag.tagId, admin_id]);
            });
        await sails.sendNativeQuery(tagQuery , [tagParams] );


         let rulesData = await sails.sendNativeQuery('CALL getRulesByRuleId($1);', ([ rules.id ]) );

         this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: rulesData });
       }
       else {
         this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
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
