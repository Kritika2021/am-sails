module.exports = {


  friendlyName: 'Pet create',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs) {

    var users = await Ur.find({ owner : 1}).populate('pets');
   console.log(users);

  }


};
