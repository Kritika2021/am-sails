const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Create rules',


  description: '',


  inputs: {
   

  },


  exits: {

  },


  fn: async function (inputs) {
  try{

      
      let data = this.req.param('body');

      // console.log(data[0].admin_id);
      // console.log(data[0].rules_name);

        if (utilities.validateInputExist(data[0].rules_name)  && (data[0].tagList != null) && (data[0].messageList != null) ){

          let rules = await Rules.create({ rules_name : inputs.rules_name , admin_id : inputs.admin_id }).fetch();
          //console.log(rules.id);

          if(rules.id){

          //  console.log("Comes when verified");

          let ruleMsgQuery = "Insert into rules_messages (fk_rules_id, fk_message_id, added_by) values ?";
              let params = [];
            await data[0].messageList.map(message => {
                params.push([ rules.id , message, data[0].admin_id ]);
            });

            console.log("Message List Params :" , params);

          await sails.sendNativeQuery(ruleMsgQuery , [params] );


        let tagQuery = "Insert into rules_tag (fk_rules_id, fk_tag_id, added_by) values ?";
            let tagParams = []; 
            await data[0].tagList.map(tag => { 
                tagParams.push([rules.id, tag, data[0].admin_id]);
            });
            console.log("Tag list Params :" , params);
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
