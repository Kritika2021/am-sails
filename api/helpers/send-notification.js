module.exports = {


  friendlyName: 'Send notification',


  description: '',


  inputs: {

   title:{
      type:'string',
      defaults : "titlename"
    },
    message:{
      type:'string',
      defaults : "titlename"
    },
    from_user_id:{
      type:'number'
    },
    to_user_id:{
      type:'number'
    },
    chat_id:{
      type:'number', 
    },
    unique_code:{
      type:'string',
    },
    type:{
      type:'string'
    }

  },


  exits: {

    success: {
      description: 'All done.',
    },

  },

  
  fn: async function (inputs) {

    console.log("Notification Sent");

    await Notifications.create({ title : inputs.title, message : inputs.message, from_user_id : inputs.from_user_id, to_user_id : inputs.to_user_id, chat_id : inputs.chat_id, unique_code : inputs.unique_code, type : inputs.type });
    
    
   //sails.sockets.broadcast(['room1'], { user_id : 1 , title : inputs.title, message : inputs.message, data : inputs.notificationData });
  }


};

