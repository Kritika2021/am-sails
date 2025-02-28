module.exports = {


  friendlyName: 'Call notification',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs) {
 //(user_id, title, msg, data = {}) to a service,
   await sails.helpers.sendNotification.with({
      user_id: inputs.inputs.user_id,
      title: 'TITLE',
      message:'MESSAGE',
      notificationData: {
        fullName: user.fullName,
      }
    });

  }


};
