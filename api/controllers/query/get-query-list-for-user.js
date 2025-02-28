

const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants"); 

module.exports = {


  friendlyName: 'Get query list for user',


  description: '',


  inputs: {
    search_text:{
      type:'string',
    },
    user_id:{
      type:'ref',
      columnType:'integer'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            //let body = req.body;

            let params = this.req.allParams();
            let search = inputs.search_text ? "%" + inputs.search_text + "%" : null;
            let page = params.page ? parseInt(params.page) : constants.pageConstants.defaultPage;
            let offset = (page - 1) * constants.pageConstants.pageLength;
            let userQuery = await sails.sendNativeQuery('CALL getUserQueryList($1, $2, $3, $4);', ( [inputs.user_id, search, constants.pageConstants.pageLength, offset] ));
            console.log(userQuery);
           // console.log( userQuery[0]);

            if(params.page == 1){
                let user = await User.find({ id : inputs.user_id });
                //await socket.askQueryAfterLoginSocket(req.user_id)//check
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data:'' , profile: user });
            }else{
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: '' });
            }
        }
        catch (e) {
            console.error(":: e ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);

        }

  }


};
