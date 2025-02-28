const constants = require("../globals/constants");
//const nodemailer = require("nodemailer");
//const utilities = require("../globals/utilities");
const sgMail = require('@sendgrid/mail');
const emailTemplates = require("../globals/emailTemplates");
//sgMail.setApiKey(process.env.SENDGRID_API_KEY)
sgMail.setApiKey(constants.SENDGRID.API_KEY);


module.exports = {


  friendlyName: 'Email sender',


  description: '',


  inputs: {
    admin_name :{
      type:'string'

    },
    emailId:{
      type:'string'
    },
    password:{
      type:'string'
    },
    adminTypes:{
      type:'string'
    }

  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs) {
    // TODO

     const msg = {
                        to: 'kritika@novateur.app', // Change to your recipient
                        from: 'gk@novateur.app', // Change to your verified sender
                        subject: "Welcome To Astro Mihir Admin Panel ✔ you are successfully registered ",
                        //text: 'and easy to do anywhere, even with Node.js',
                        html: (await emailTemplates.adminCredTemplates(inputs.admin_name, inputs.emailId, inputs.password, inputs.adminTypes)).toString()
                    }
        sgMail.send(msg).then(() => {
                console.log('Email sent')
        }).catch((error) => {
                console.error(error)
        })     
  }


};

