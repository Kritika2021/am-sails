const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");


module.exports = {


  friendlyName: 'Set registration amount',


  description: '',


  inputs: {
    settings_id:{
        type:'ref',
        columnType:'integer'
    },
    amount:{
        type:'ref',
        columnType:'double'
    },
    currency_code:{
        type:'string',

    },
    currency_symbol:{
        type:'string'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

    try {
           
            if (utilities.validateInput(inputs.settings_id) && utilities.validateInput(inputs.amount) && !(isNaN(inputs.amount)) 
                 && !(isNaN(inputs.settings_id)) &&  utilities.validateInputExist(inputs.currency_code)&& utilities.validateInputExist(inputs.currency_symbol)) {
                //let result = await paymentBAObj.setRegistrationAmountBA(req.admin_id,reqData.settings_id,reqData.amount,reqData.currency_symbol ,reqData.currency_code);

                let result = await Registration_settings.update({id : inputs.settings_id }).set({ registration_amount : inputs.amount,admin_id : inputs.admin_id , 
                                                                                                    updated_on : moment().format('YYYY-MM-DDTHH:mm:ssZ') ,currency_symbol : inputs.currency_symbol,
                                                                                                    currency_code : inputs.currency_code });
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true,data:result[0] });
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
