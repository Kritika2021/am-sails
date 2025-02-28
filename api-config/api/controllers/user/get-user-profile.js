const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");

module.exports = {


  friendlyName: 'Get user profile',


  description: '',


  inputs: {

     mobile_number :{
      type: 'ref',
      columnType:'integer',
      description: 'Contact number of user',
      required :true,
    },

    
    country_code: {
      type: 'string',
      description: 'Country code',
      required :true,
    },

  },


  exits: {

  },


  fn: async function (inputs) {
    try{
        // Vaidations
        if (utilities.validateInput(inputs.country_code) && utilities.validateInput(inputs.mobile_number)) {

          let user = await User.find({ country_code : inputs.country_code , mobile_number : inputs.mobile_number });
          this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: user });

        }
    }catch(e){
      console.error("Internal error ", e)
           this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
    }


  }


};
