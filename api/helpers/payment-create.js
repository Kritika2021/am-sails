
const constants = require("../globals/constants");
//const nodemailer = require("nodemailer");
//const utilities = require("../globals/utilities");
const sgMail = require('@sendgrid/mail');
const emailTemplates = require("../globals/emailTemplates");
//sgMail.setApiKey(process.env.SENDGRID_API_KEY)
sgMail.setApiKey(constants.SENDGRID.API_KEY);


module.exports = {


  friendlyName: 'Payment create',


  description: '',


  inputs: {
    userName:{
        type:'string'
    },
    emailId:{
        type:'string'
    },
    amount:{
        type:'number'
    },
    userFirstQuery:{
        type:'string'
    },
    notes:{
        type:'string'
    }

  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs) {
     try{
            if (inputs.notes == null) {

                //console.log("Comes in try section");

                let info = await sgMail.send({
                    from: constants.MAIL_CONFIG.email,
                    to: inputs.emailId,
                    subject: "Astro Mihir admin requested for payment ", 
                    html: (await emailTemplates.createPaymentWithoutText(inputs.userName,inputs.amount,inputs.userFirstQuery)).toString()
                    }).then(() => {
                        console.log('Email sent')
                    }).catch((error) => {
                        console.error(error)
                    });
            }
            else{

                //console.log("Comes in else section");

                let info = await sgMail.send({
                    from: constants.MAIL_CONFIG.email,
                    to: inputs.emailId,
                    subject: "Astro Mihir admin requested for payment ", 
                    html: (await emailTemplates.paymentCreateTemplate(inputs.userName,inputs.amount,inputs.notes,inputs.userFirstQuery)).toString()
                    }).then(() => {
                        console.log('Email sent')
                    }).catch((error) => {
                        console.error(error)
                    });
            }
        }
        catch (e){
            console.error("Internal error ", e)
            //this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }
  }


};

