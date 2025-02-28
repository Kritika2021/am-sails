const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");


module.exports = {


  friendlyName: 'Admin profile information',


  description: '',


  inputs: {
    admin_id:{
      type:'number'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

     try {
            let adminInfo = await Admin.find({ id : inputs.admin_id }).fetch();
            //sails.log(adminInfo);
            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: adminInfo[0] });

        }
        catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
