const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'User lock unlock',


  description: '',


  inputs: {
    is_locked:{
      type:'boolean' , defaultsTo : false
    },
    user_id:{
      type:'number',
      
      required:true
    },
    admin_id :{
      type:'number',
    }

  },


  exits: {

  },


  fn: async function (inputs) {
  try{
           if (utilities.validateInput(inputs.is_locked) && utilities.validateInput(inputs.user_id)) {

            // Check user and admin exists
            let userData = await sails.sendNativeQuery('CALL checkUserExists($1);', ([inputs.user_id]) );
            let adminData = await sails.sendNativeQuery('CALL checkAdminExists($1);', ([inputs.admin_id]) );
            //console.log(userData.rows[0].length);
            //console.log(adminData.rows[0].length);

            if(userData.rows[0].length > 0 && adminData.rows[0].length){
                let updateRecord = await User.update({id : inputs.user_id }).set({ is_locked : inputs.is_locked , locked_by : inputs.admin_id });
               

                if(inputs.is_locked == 1){
                  // insert Lock record
                  let data = await UserLockUnlockLog.create({admin_id : inputs.admin_id , user_id : inputs.user_id , action : 'LOCK' });
                  this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true , message : 'Notification Sent'});
                }else
                {
                  // insert UnLock record
                  let data = await UserLockUnlockLog.create({admin_id : inputs.admin_id , user_id : inputs.user_id , action : 'LOCK' });
                  this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true , message : 'Notification Sent'});
               }
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
