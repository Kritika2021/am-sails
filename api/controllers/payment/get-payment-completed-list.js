const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");
const moment = require('moment');
const moment_timezone = require('moment-timezone');


module.exports = {


  friendlyName: 'Get payment completed list',


  description: '',


  inputs: {
    search_text:{
      type:'string'
    },
    from_date:{
      type:'ref',
      columnType:'DATE'
    },
    to_date:{
      type:'ref',
      columnType:'DATE'
    },
    payment_status:{
      type:'string'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

  
            let dataParams = this.req.allParams();
            let search = utilities.validateInput(inputs.search_text) ? "%" + inputs.search_text + "%" : null;
            let page = dataParams.page ? parseInt(dataParams.page) : constants.pageConstants.defaultPage;
            let offset_value = (page - 1) * constants.pageConstants.pageLength;

             let from_date = null;
            let to_date = null;
            if (utilities.validateInput(inputs.from_date) && utilities.validateInput(inputs.to_date)) {
                if (moment_timezone(inputs.from_date).isValid() && moment_timezone(inputs.to_date).isValid()) {
                    from_date = moment_timezone(inputs.from_date).startOf('date').format();
                    to_date = moment_timezone(inputs.to_date).endOf('date').format();
                }
                else {
                    this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
                }
            }

            let payment_status = null;
            if (utilities.validateInput(inputs.payment_status)) {
                payment_status = inputs.payment_status;
            }
            else payment_status = "ALL";

            //let payments = await paymentBAObj.getPaymentCompletedListBA(search, from_date, to_date, payment_status, constants.pageConstants.pageLength, offset_value);

            let params = [];
            let query = "SELECT pt.id, pt.user_id, u.username, pt.amount,"+
            "pt.GST, pt.total_amount, pt.currency_code, pt.currency_symbol,pt.payment_for,"+
            "concat('#',pt.payment_relation_id) as transactionId, pt.order_id, pt.payment_method,"+
            "pt.paid_on, pt.payment_status, pt.refund_id "+
            "FROM payment_transaction AS pt "+
            "JOIN user AS u ON (u.id = pt.user_id and u.is_locked = 0)"

            if(inputs.search_text != null ||  inputs.payment_status != "ALL" || inputs.from_date != null || inputs.to_date != null){
                query  += " where " 
            } 

            let whereCondition = "";
            if(inputs.search_text){
                whereCondition += " (pt.amount LIKE $1 OR pt.payment_relation_id LIKE $2 OR pt.paid_on LIKE $3 "+
                "OR pt.payment_method LIKE $4 OR pt.total_amount LIKE $5 OR u.username LIKE $6) ";
                params.push(inputs.search_text,inputs.search_text,inputs.search_text,inputs.search_text,inputs.search_text,inputs.search_text);
            }
            if(inputs.payment_status == "CAPTURED"){
                if(inputs.search_text){
                    whereCondition += " AND ";
                }
                whereCondition += " pt.payment_status = 'captured' AND pt.refund_id is null ";
            }
            else if(inputs.payment_status == "REFUNDED"){
                if(inputs.search_text){
                    whereCondition += " AND ";
                }
                whereCondition += " pt.payment_status = 'captured' AND pt.refund_id is not null ";
            }
            else if(inputs.payment_status == "PENDING"){
                if(inputs.search_text){
                    whereCondition += " AND ";
                }
                whereCondition += " pt.payment_status is null ";
            }
            
            if(inputs.from_date && inputs.to_date){
                if(inputs.search_text || inputs.payment_status != "ALL" ){
                    whereCondition += " AND ";
                }
                whereCondition += "  pt.createdAt between $7 and $8 ";
                params.push(inputs.from_date,inputs.to_date);
            }
            query += whereCondition;
            query += " ORDER BY pt.paid_on DESC"
            query += " LIMIT $9 OFFSET $10 ";

            console.log("Query " + query);
            let limit_number = constants.pageConstants.pageLength;
            let offset_number = offset_value;

            params.push(limit_number,offset_number); 
            // //return await db.query(query, params);

            console.log(params);
            let payments = await sails.sendNativeQuery(query, params);
            console.log(payments[0]);

            if(page == 1){
                let totalAmount = await sails.sendNativeQuery('CALL get_payment_details();');
                
                console.log("Total Amount" + totalAmount);

              
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: payments, revenueDetails:totalAmount.rows[0]});
            }
            else {
                this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: payments });
            }
       






       }
  


};
