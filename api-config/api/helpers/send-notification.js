module.exports = {


  friendlyName: 'Send notification',


  description: '',


  inputs: {

    user_id:{
      type:'number',
    },
    title:{
      type:'string'
    },
    message:{
      type:'ref',
      columnType:'text'
    },
    notificationData:{
      type:{}
    }

  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs) {
   //sails.sockets.broadcast(['room1'], { user_id : 1 , title : inputs.title, message : inputs.message, data : inputs.notificationData });
  }


};

