
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");

module.exports = {


  friendlyName: 'Profile account information',


  description: '',


  inputs: {
     
     user_id:{
      type:'ref',
      columnType:'integer'
     }

  },


  exits: {

  },


  fn: async function (inputs) {

     try {
            if(utilities.validateInput(inputs.user_id)) {

            let user = await User.find({  where: { id : inputs.user_id } });
            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: user });

          }
        }
        catch (e) {
            console.error("Internal error ", e);
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }
  }
};
