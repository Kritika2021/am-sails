module.exports = {


  friendlyName: 'Pet create',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs) {

    var users = await Ur.find().populate('pets');
   console.log(users);

  }


};
