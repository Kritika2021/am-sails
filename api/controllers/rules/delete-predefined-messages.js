const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");
const moment = require('moment');


module.exports = {


  friendlyName: 'Delete predefined messages',


  description: '',


  inputs: {
    messageId :{
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
            if (utilities.validateInput(inputs.messageId)) {
            //let adminData = await sails.sendNativeQuery('CALL checkAdminExists($1);', ([inputs.admin_id]) );
            let adminData = await Admin.find({ id: inputs.admin_id, is_deleted : 0 });

            if(adminData.length > 0){ 

                //let deleteResult = await sails.sendNativeQuery('CALL delete_predefined_message($1, $2);', ( [inputs.messageId, inputs.admin_id] ) );
                //sails.log(deleteResult.rows);

                //    SELECT COUNT(*) INTO MESSAGES_COUNT from rules_messages where fk_message_id = message_Id AND is_deleted = 0;

                //     if MESSAGES_COUNT = 0 THEN
                //         UPDATE predefined_messages AS pm 
                //         SET  pm.is_deleted = 1 , pm.deleted_on = CURRENT_TIMESTAMP ,pm.deleted_by = admin_id
                //         WHERE pm.messageId = message_Id ;
                    
                //         SET SUCCESS = 1;
                //     ELSE 
                //         SET SUCCESS = 0;
                //     END IF;


            let msgCount = await Rules_messages.count({ fk_message_id : inputs.messageId , is_deleted : 0 });
            console.log( "Message Count" , msgCount);

                if(msgCount == 0){
                let updateDelData = await Predefined_messages.update({ id : inputs.messageId })
                                                              .set({ is_deleted : 1, deleted_on : new Date() , deleted_by : inputs.admin_id });
                
                console.log("Updated Data", updateDelData);                                              
                if (updateDelData) 
                    this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });
                }
                else {
                    this.res.status(responseCode.ServerErrors.Codes.MESSAGE_IS_IN_USE.error_code).send(responseCode.ServerErrors.Codes.MESSAGE_IS_IN_USE)
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
