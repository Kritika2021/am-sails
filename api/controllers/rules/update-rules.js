const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");



module.exports = {


  friendlyName: 'Update rules',


  description: '',


  inputs: {
    rules_id:{
      type:'number'
    },
    rules_name:{
      type:'string'

    },
    tagList:{
      type:'ref'
     // columnType:'arraybuffer'
    },
    messageList:{
      type:'ref'
    },
    admin_id:{
      type:'number'
    }


  },


  exits: {

  },


  fn: async function (inputs) {

    try {

            
            var arr = inputs.messageList;

            console.log(inputs.messageList);

            if (utilities.validateInputExist(inputs.rules_id) && utilities.validateInputExist(inputs.rules_name) && inputs.tagList.length > 0 && inputs.messageList.length > 0) {
               // await rulesBA.updateRulesBA(body.rules_id, body.rules_name);
               //let updateData = await Rules.update({ pk_rulesId : inputs.rules_id }).set({ rules_name : inputs.rules_name });
          
              //  await rulesBA.deleteRulesMessagesBA(body.rules_id);
              // let deleteMessages = await Rules_messages.destroy({ fk_rules_id : inputs.rules_id });

               // await rulesBA.addRulesMessagesBA(body.rules_id, body.messageList, req.admin_id);
                let query = "Insert into rules_messages (fk_rules_id, fk_message_id, added_by) values $1";
                let params = [];
 
                await [inputs.messageList].map(message => { 
                    //params.push([inputs.rules_id, message.messageId, inputs.admin_id]);
                    params.push(['1', '1', '1']);

                });

                sails.log(params);
                let data = await sails.sendNativeQuery(query , [params]);
                sails.log(data);
               // return await db.query(query, [params]);
               

               // await rulesBA.deleteRulesTagsBA(body.rules_id);
                let deleteRules = await Rules_tag.destroy({ fk_rules_id : inputs.rules_id });


                //await rulesBA.addRulesTagBA(body.rules_id, body.tagList, req.admin_id);
                let queryTag = "Insert into rules_tag (fk_rules_id, fk_tag_id, added_by) values $1";
                let paramsTag = []; 
                await [inputs.tagList].map(tag => {
                   //params.push([rulesId, tag.tagId, admin_id]);
                    paramsTag.push(['1', '1', '1']);
                });
                sails.log(paramsTag);
                let dataTag = await sails.sendNativeQuery(queryTag , [paramsTag]);
                sails.log(dataTag);


                //let rulesData = await rulesBA.getRuleByRuleIdBA(inputs.rules_id);
                let rulesData = await sails.sendNativeQuery('CALL getRulesByRuleId($1);', ([params.ruleid]) );
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: rulesData });
            } else {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
        } catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
