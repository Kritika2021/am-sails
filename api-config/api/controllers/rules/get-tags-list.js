const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Get tags list',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs) {

   try {
          let tagsList = await sails.sendNativeQuery('CALL get_tag_names();', []);
          this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: tagsList.rows[0] });
        }
        catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
