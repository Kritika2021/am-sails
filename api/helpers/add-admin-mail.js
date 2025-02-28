const constants = require("../globals/constants");

const sgMail = require('@sendgrid/mail');
const emailTemplates = require("../globals/emailTemplates");

sgMail.setApiKey(constants.SENDGRID.API_KEY);

module.exports = {


  friendlyName: 'Add admin mail',


  description: '',


  inputs: {

  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs) {

     try{
            let info = await sgMail.send({
            from: constants.MAIL_CONFIG.email,
            to: emailId,
            subject: "Welcome To Astro Mihir Admin Panel ✔ you are successfully registered ", 
            //text: "Admin Type: "+admin_types+"\n Username: "+emailId+"\n Password: "+password,
            html: (await emailTemplates.adminCredTemplates(admin_name, emailId, password, admin_types)).toString()
            }).then(() => {
                console.log('Email sent')
            }).catch((error) => {
                console.error(error)
            });
        }
        catch (e){
            console.error("Internal error ", e)
        } 

      // TODO
  }


};

