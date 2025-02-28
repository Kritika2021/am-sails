const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Get user lock unlock by admin log',


  description: '',


  inputs: {
    
  },


  exits: {

  },


  fn: async function () {
       try{
            let params = this.req.allParams();
            if (!(utilities.validateInputExist(params.adminId))) {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
            else {
                let pageNo = params.page ? parseInt(params.page) : constants.pageConstants.defaultPage;
                let offset = (pageNo - 1) * constants.pageConstants.pageLength;
                let lockUnlockLog = await sails.sendNativeQuery('CALL get_user_lock_unlock_by_admin_log($1, $2, $3);' , [ params.adminId, constants.pageConstants.pageLength, offset ]);
                sails.log(lockUnlockLog.rows);
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: lockUnlockLog.rows });
          }
        }
        catch (e) {

            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
