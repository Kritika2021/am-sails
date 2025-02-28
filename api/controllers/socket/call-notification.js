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
      title: 'Notification Title',
      message:'MESSAGE',
      from_user_id: 1,
      to_user_id : 1,
      chat_id:0,
      unique_code: 110,//unique_code = from_user_id+""+to_user_id+""+chat_id
      type:""
    });

  }


};
