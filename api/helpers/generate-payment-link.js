const responseCode = require("../globals/apiResponse");
const utilities = require("../globals/utilities");
const constants = require("../globals/constants");
const btoa = require('btoa');
const axios = require('axios');




module.exports = {


  friendlyName: 'Generate payment link',


  description: '',


  inputs: {
    username :{
      type:'string'
    },
    country_code:{
      type:'number'
    },
    mobile_number:{
      type:'ref',
      columnType:'integer'
    },
    email_id:{
      type:'string'
    },
     amount:{
      type:'number'
    },
     
    notes:{
      type:'string',

    },
    thread_id:{
      type:'ref',
      columnType:'integer'
    },
   

  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs) {
            try {

            let threadValue = btoa("consumer_query_thread_id:" + inputs.thread_id);
            //console.log("thread value" + threadValue);

            let razorPayUrl = sails.config.custom.PAYMENT_LINK_URL,
                username = sails.config.custom.TEST.USER_NAME,
                password = sails.config.custom.TEST.PASSWORD,
                callbackUrl = sails.config.custom.TEST.CALLBACK_URL + "?val=" + threadValue;
                //callbackUrl = "http://localhost:4200/#/home" + "?val=" + threadValue;
            // if (process.env.RUNNING_SERVER_HOST == 3) {
            //     username = config.PAYMENT_GATEWAY.PROD.USER_NAME;
            //     password = config.PAYMENT_GATEWAY.PROD.PASSWORD;
            //     callbackUrl = config.PAYMENT_GATEWAY.PROD.CALLBACK_URL + "?val=" + threadValue;
            // }

            let obj = {
                amount: parseFloat(inputs.amount) * 100,
                currency: "INR",
                //expire_by: new Date().valueOf(),
                description: inputs.notes,
                customer: {
                    name: inputs.username,
                    contact: "+" + inputs.country_code + inputs.mobile_number,
                    email: inputs.email_id
                },
                notify: {
                    email: true,
                    sms: true
                },
                callback_url: callbackUrl,
                callback_method: "get"
            };


            let pay = await axios.post(razorPayUrl, obj, {
                auth: {
                    username: username,
                    password: password,
                },
            });

            //console.log(pay.data);
            return { status: true, resp: pay.data }
        }
        catch (e) {
            console.error("============error ========>", e)
            throw e;
        }
  }


};

