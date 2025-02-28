module.exports = {


  friendlyName: 'Test',


  description: 'Test socket.',


  inputs: {
   id:{
    type:'number'
   }
  },


  exits: {

  },


  fn: async function (inputs) {

    console.log("test");
    console.log(inputs.id);

  }


};
