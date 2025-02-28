const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");
const moment = require('moment-timezone');

module.exports = {


  friendlyName: 'Get dashboard item',


  description: '',


  inputs: {
   startDate:{
    type:'string',
    
   },
   endDate:{
    type:'string',
   
   }
  },


  exits: {

  },


  fn: async function (inputs) {

    try{
            let startDate = inputs.startDate ? new Date(moment(inputs.startDate).startOf('day').format()) : new Date(moment().startOf('day').format());
            let endDate = inputs.endDate? new Date(moment(inputs.endDate).endOf('day').format()) : new Date(moment().endOf('day').format());
            let items = await sails.sendNativeQuery('CALL adminDashboard($1, $2);' , ([startDate, endDate]) );
            sails.log(items);
            // let resp = {
            //     totalRevenue:items[0][0], filterRevenue:items[1][0], totalAmount:items[2][0], filterAmount:items[3][0],
            //     totalQuery:items[4][0], filterQuery:items[5][0], totalUser:items[6][0], filterUser:items[7][0],
            //     lastTransaction:items[8],lastQuery:items[9]
            // };
            // res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({status:true, data:resp})
        }
        catch (e){
          //  res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR)
        }

  }


};
