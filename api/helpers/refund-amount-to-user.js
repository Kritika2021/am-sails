const axios = require('axios');

module.exports = {


  friendlyName: 'Refund amount to user',


  description: '',


  inputs: {
    
    payment_id:{
      type:'string',
    },
    total_amount:{
      type:'ref',
      columnType:'double',
    },

  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs) {
     try {

          console.log(inputs.payment_id);
          console.log(inputs.total_amount);

            let username = sails.config.custom.TEST.USER_NAME,
                password = sails.config.custom.TEST.PASSWORD;
            // if (process.env.RUNNING_SERVER_HOST == 3) {
            //     username = config.PAYMENT_GATEWAY.PROD.USER_NAME;
            //     password = config.PAYMENT_GATEWAY.PROD.PASSWORD;
            // }
            
            let obj = {
                amount: inputs.total_amount * 100
            };
            let refundUrl = "https://" + username + ":" + password + "@api.razorpay.com/v1/payments/" + inputs.payment_id + "/refund";
            console.log("my refund UL", refundUrl);
            
            let refund = await axios.post(refundUrl, obj, {});
            //console.log(refund.data);
        }
        catch (e) {
            throw e;
        }
  }


};

