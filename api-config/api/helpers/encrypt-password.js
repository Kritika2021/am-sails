
const bcrypt = require('bcrypt');
const saltRounds = 13;

module.exports = {


  friendlyName: 'Encrypt password',


  description: '',


  inputs: {
    password:{
      type: 'string'
    }
  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs) {
    // TODO Validation

    return await bcrypt.hash(inputs.password,saltRounds);
   }

};

