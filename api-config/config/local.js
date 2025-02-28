/**
 * Local environment settings
 *
 * Use this file to specify configuration settings for use while developing
 * the app on your personal system.
 *
 * For more information, check out:
 * https://sailsjs.com/docs/concepts/configuration/the-local-js-file
 */

module.exports = {

  // Any configuration settings may be overridden below, whether it's built-in Sails
  // options or custom configuration specifically for your app (e.g. Stripe, Sendgrid, etc.)


    custom:{
       // PAYMENT VARIABLE
        PAYMENT_LINK_URL:"https://api.razorpay.com/v1/payment_links",
        TEST:{
            USER_NAME: "rzp_test_tfPcVeJJty1FJm",
            PASSWORD: "oWVEx3DzmrTDdChlRt040dbh",
            CALLBACK_URL:"http://65.1.79.103:8000/home",
            CALLBACK_URL_PROFILE: "http://65.1.79.103:8000/profile?success=true"
        },
        // PROD:{
        //     USER_NAME: "rzp_live_T7wSMejo3d3F96",
        //     PASSWORD: "LbBZ8mgcjVGJ9z2sPQg9YXF2",
        //     CALLBACK_URL:"https://app.astromihir.com/home",
       
    }

};
