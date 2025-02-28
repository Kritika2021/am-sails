
const axios = require('axios');

module.exports = {


  friendlyName: 'Generate payment link for registration',


  description: '',


  inputs: {
    user :{
      type:'ref'
    },
    query_content:{
      type:'string'
    },
    amount:{
      type:'ref',
      columnType:'number'
    }

  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs) {
   try {
            console.log(inputs.user.username);
            
         
            let razorPayUrl = sails.config.custom.PAYMENT_LINK_URL,
                username = sails.config.custom.TEST.USER_NAME,
                password = sails.config.custom.TEST.PASSWORD,
                callbackUrl = sails.config.custom.TEST.CALLBACK_URL_PROFILE;
            // if (process.env.RUNNING_SERVER_HOST == 3) {
            //     username = config.PAYMENT_GATEWAY.PROD.USER_NAME;
            //     password = config.PAYMENT_GATEWAY.PROD.PASSWORD;
            //     callbackUrl = config.PAYMENT_GATEWAY.PROD.CALLBACK_URL_PROFILE;
            // }

            let obj = {
                amount: parseFloat(1) * 100,
                currency: "INR",
                //expire_by: new Date().valueOf(),
                description:'sdsdsdsds',
                customer: {
                    name: inputs.user.username,
                    contact:"+" + inputs.user.country_code + inputs.user.mobile_number,
                    email: inputs.user.email_id
                },
                notify: {
                    email: false,
                    sms: false
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

            console.log("PAY object " + pay);
            //return { status: true , resp: pay.data }
        }
        catch (e) {
            console.error("============error ========>", e)
            throw e;
        }
  }


};

