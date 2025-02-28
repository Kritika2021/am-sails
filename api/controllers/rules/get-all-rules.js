const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");



module.exports = {


  friendlyName: 'Get all rules',


  description: '',


  inputs: {
    search_text:{
      type:'string'
    },
    page:{
      type:'number'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

     try {
       // let reqData = req.body;
        if (utilities.validateInput(inputs.search_text)) {
            inputs.search_text = "%" + inputs.search_text + "%"
        }
        else {
            inputs.search_text = null;
        }
        if (!utilities.validateInput(inputs.page)) {
            inputs.page = 1
        }
        let offset_value = (inputs.page - 1) * constants.pageConstants.pageLength;
        let rulesData = await sails.sendNativeQuery('CALL getAllRulesWithSearch($1, $2, $3);', ([inputs.search_text,constants.pageConstants.pageLength, offset_value])  )
        sails.log(rulesData.rows[0]);

         let dataRules = [];
         await rulesData.rows[0].map(rules => {
             let rulesId = rules.id;
             let rulesName = rules.rules_name;
             let message = { messageId: rules.messageId, message: rules.message };
             let tag = { tagId: rules.tag_id, tag_name: rules.tag_name }
             let ruleIndex = dataRules.findIndex(rule => rule.rulesId == rulesId);


             console.log("Index" , ruleIndex);

             if(ruleIndex != -1){
                 if(data[ruleIndex].messages.findIndex(mes => mes.messageId == message.messageId) == -1){
                     data[ruleIndex].messages.push(message);
                 }

                 if(data[ruleIndex].tags.findIndex(t => t.tagId == tag.tagId) == -1){
                     data[ruleIndex].tags.push(tag)
                 }
             }else{
                 dataRules.push({
                     rulesId: rulesId,
                     rulesName: rulesName,
                     messages: [message],
                     tags: [tag]
                 })
             }
         });

         console.log(dataRules);


         //return data;







        this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data:rulesData.rows[0] , record : dataRules });
    }
    catch (e) {
        console.error("Internal error ", e)
        this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
    }
    

  }


};
