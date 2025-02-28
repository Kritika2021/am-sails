
const constants = require("../globals/constants");
//const nodemailer = require("nodemailer");
//const utilities = require("../globals/utilities");
const sgMail = require('@sendgrid/mail');
const emailTemplates = require("../globals/emailTemplates");
//sgMail.setApiKey(process.env.SENDGRID_API_KEY)
sgMail.setApiKey(constants.SENDGRID.API_KEY);

module.exports = {


  friendlyName: 'Refund status',


  description: '',


  inputs: {

    userName:{
      type:'string'
    }, 
    emailId:{
      type:'string'
    }, 
    refundId:{
      type:'number'
    },
    currencySymbol:{
     type:'string'
    },
    refundAmount:{
      type:'number'
    },
    refundDate:{
      type:'ref',
      dataType:'datetime'
    },
    transactionId:{
      type:'number'
    }

  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs) {
     try {
            let info = await sgMail.send({
                from: constants.MAIL_CONFIG.email,
                to: inputs.emailId,
                subject: "Refund initiated from Astro Mihir!", 
                //html: (await emailTemplates.refund(inputs.userName, inputs.currencySymbol+""+inputs.refundAmount, inputs.transactionId, inputs.refundId, inputs.refundDate)).toString()
                html: (await emailTemplates.refund("kritika", "Rs"+""+"100", "23232323232", "3434343434343", "22/04/2024")).toString()
                }).then(() => {
                    console.log('Email sent')
                }).catch((error) => {
                    console.error(error)
                });
        }
        catch (e){
            console.error("Internal error ", e)
            res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }
  }


};

