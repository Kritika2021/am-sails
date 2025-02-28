const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");
const moment = require('moment-timezone');

module.exports = {


  friendlyName: 'Get dashboard graph',


  description: '',


  inputs: {
    year:{
      type:'ref',
      columnType:'integer'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

     try{
            let currentYear = moment().year();

            if(currentYear >= parseInt(inputs.year)){
              sails.log("Sssss");
                let items = await sails.sendNativeQuery('CALL dashboard_Graph($1);', [(inputs.year)] );
                sails.log(items.rows[0]);
            //     let result = {
            //         revenueEarning:items[0], revenueRefund:items[1] ,totalUser:items[2], answerAndPending:items[3],
            //         topCityUser:items[4], topCityRevenue:items[5]  
            //     };
            //     res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({status:true,  data:result})
            // }
            // else{
            //     res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            // }
        }
      }
        catch (e){
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR)
        }

  }


};
