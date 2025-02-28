const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");



module.exports = {


  friendlyName: 'Delete tags',


  description: '',


  inputs: {
    tag_id:{
      type: 'number'
    },
    admin_id:{
      type:'number'
    },
    rules_id:{
        type:'number'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            
            if (utilities.validateInput(inputs.tag_id)) {

                //let adminData = await sails.sendNativeQuery('CALL checkAdminExists($1);', ([inputs.admin_id]) );
                //let rulesData = await sails.sendNativeQuery('CALL checkRuleExists($1);', ([inputs.rules_id]) );

                let adminData = await Admin.find({ id :inputs.admin_id, is_deleted : 0 });
                let rulesData = await Rules.find({ id :inputs.rules_id });

                console.log(adminData.length);
                console.log(rulesData.length);

                if(adminData.length && rulesData.length){

                //let deleteTag = await sails.sendNativeQuery('CALL delete_tags($1, $2);' , ([inputs.tag_id, inputs.admin_id]) );
                // SELECT COUNT(*) INTO TAG_COUNT from rules_tag where fk_tag_id = tag_id && is_deleted = 0;

                // if TAG_COUNT = 0 THEN
                //     UPDATE tags AS t 
                //     SET  t.is_deleted = 1 , t.deleted_on = CURRENT_TIMESTAMP ,t.deleted_by = admin_id
                //     WHERE t.tag_id = tag_id ;
                
                //     SET SUCCESS = 1;
                // ELSE 
                //     SET SUCCESS = 0;
                // END IF;

                let totalTag = await Rules_tag.count({ fk_tag_id : inputs.tag_id, is_deleted : 0 });
                console.log(totalTag);
                
                if(totalTag > 0){
                   let deleteTag = await Tags.update({ id : inputs.tag_id })
                                             .set({ is_deleted : 1 , deleted_on : new Date() ,deleted_by : inputs.admin_id });
                


                   sails.log(deleteTag);
                   if (deleteTag) {
                        this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ Result : deleteTag, status: true });
                    }
                    else {
                        this.res.status(responseCode.ServerErrors.Codes.TAG_IS_IN_USE.error_code).send(responseCode.ServerErrors.Codes.TAG_IS_IN_USE)
                    }
                }
                else{
                    console.log("No Tag Found ")
                }
            }else{
                    console.log("Admin Or Rule id not exists");
            }
            
        }
        else {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
    }// End of try
        catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }
  }


};
