const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");
const moment = require('moment');
const moment_timezone = require('moment-timezone');
module.exports = {


  friendlyName: 'Get payment for user',


  description: '',


  inputs: {
    search_text:{
      type:'string'
    },
    payment_status:{
        type:'string'
    },
    to_date:{
        type:'ref',
        columnType:'DATE'
    },
    from_date:{
        type:'ref',
        columnType:'DATE'
    }


  },


  exits: {

  },


  fn: async function (inputs) {

   try {
            let params = this.req.allParams();

            //console.log(params);

            let search = utilities.validateInput(inputs.search_text) ? "%" + inputs.search_text + "%" : null;
            let page = params.page ? parseInt(params.page) : constants.pageConstants.defaultPage;
            let offset_value = (page - 1) * constants.pageConstants.pageLength;

            // Check input date is valid or not
            let from_date = null;
            let to_date = null;
            if (utilities.validateInput(inputs.from_date) && utilities.validateInput(inputs.to_date)) {
                if (moment_timezone(inputs.from_date).isValid() && moment_timezone(inputs.to_date).isValid()) {
                    from_date = moment_timezone(inputs.from_date).startOf('date').format();
                    to_date = moment_timezone(inputs.to_date).endOf('date').format();

                    console.log("from_date", from_date);
                    console.log("to_date", to_date);
                }
                else {
                      this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
                }
            }
            // Check payment status passed from client or not
            let payment_status = null;
            if (utilities.validateInput(inputs.payment_status)) {
                payment_status = inputs.payment_status;
            }
            else payment_status = "ALL";
            //let payments = await paymentBAObj.getPaymentForUserBA(search, req.user_id, from_date, to_date, payment_status, constants.pageConstants.pageLength, offset_value);

            let queryParams = [];
            let query = "SELECT pt.id, pt.paid_on,"+
                        "pt.amount,pt.GST,pt.payment_status,pt.currency_code,concat('#',pt.payment_relation_id) as transactionId,"+
                        "pt.total_amount,pt.currency_symbol,pt.payment_method,pt.short_url,pt.refund_id,pt.refund_entity,pt.payment_for "+
                        "FROM payment_transaction AS pt "+
                        "WHERE  pt.user_id = $1 ";


            queryParams.push(params.id);   // id = user_id

            let whereCondition = "";
            if(search){
                whereCondition += " AND  (pt.amount LIKE $2 OR pt.payment_relation_id LIKE $3 OR pt.paid_on LIKE $4 "+
                "OR pt.payment_method LIKE $5 OR pt.total_amount LIKE $6 ) ";
                queryParams.push(search,search,search,search,search);
            }
            if(payment_status == "CAPTURED"){
                whereCondition += " AND pt.payment_status = 'captured' AND pt.refund_id is null ";
            }
            else if(payment_status == "REFUNDED"){
                whereCondition += " AND pt.payment_status = 'captured' AND pt.refund_id is not null ";
            }
            else if(payment_status == "PENDING"){
                whereCondition += " AND pt.payment_status is null ";
            }
            
            if(from_date && to_date){
                whereCondition += " AND pt.created_on between $7 and $8 ";
                queryParams.push(from_date,to_date);
            }
            query += whereCondition;
            query += " ORDER BY pt.paid_on DESC"
            query += " LIMIT $9 OFFSET $10 ";

            let limit_number = constants.pageConstants.pageLength;
            let offset_number = offset_value;

           // params.push(limit_number,offset_number); 
            queryParams.push(limit_number,offset_number); 

            let payments = await sails.sendNativeQuery(query, queryParams);
            //console.log("Query" + queryParams);

            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: payments.rows[0] });
        }
        catch (e) {
            console.error("Internal error ", e);
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
