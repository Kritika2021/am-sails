/**
 * Pet.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {
  attributes: {

    breed: {
      type: 'string'
    },
    type: {
      type: 'string'
    },
    name: {
      type: 'string'
    },
    user_id:{
      model:'Ur'
    },
    // Add a reference to User
    owner: {
      model: 'Ur'
    }
  }
};
