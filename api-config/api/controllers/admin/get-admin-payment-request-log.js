const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");


module.exports = {


  friendlyName: 'Get admin payment request log',


  description: '',


  inputs: {
   
  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            let params = this.req.allParams();
            let adminId = params.adminId;
            sails.log(adminId); 

            if (!(utilities.validateInputExist(adminId))) {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
            else {
                
                let pageNo = params.page ? parseInt(params.page) : constants.pageConstants.defaultPage;
                let offset = (pageNo - 1) * constants.pageConstants.pageLength;
                let paymentLog = await sails.sendNativeQuery('CALL get_admin_payment_request_log($1, $2, $3);', [ adminId, constants.pageConstants.pageLength, offset ] );
                sails.log(paymentLog.rows);
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: paymentLog.rows[0] });
            }
        }
        catch (e) {
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
