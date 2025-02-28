const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants"); 

module.exports = {


  friendlyName: 'Get user unread query conversation for notification',


  description: '',


  inputs: {
    user_id:{
      type:'number'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            let unreadQuery = await sails.sendNativeQuery('CALL getUserUnreadQueryConversation($1);', ([inputs.user_id]) );
            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: unreadQuery.rows[0] });
        }
        catch (e) {
            console.log("Error" + e);
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
