const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");


module.exports = {


  friendlyName: 'Get registration settings',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            let result = await sails.sendNativeQuery('CALL get_registration_settings();', ([]) );
            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: result[0]});
        }
        catch (e) {
            console.error("Internal error ", e)
        }   

  }


};
