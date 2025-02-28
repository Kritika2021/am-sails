

module.exports = {


  friendlyName: 'First time password set',


  description: '',


  inputs: {
      password: {
      type : 'string',
    },
    user_id:{
      type: 'number'
    }

  },


  exits: {
    

  },


  fn: async function (inputs) {
   try {
            // TODO Validation
            //if (utilities.validateInput(inputs.password)) {
            if(1){
                let encryptPassword = await sails.helpers.encryptPassword(inputs.password);
               
                let queryStatus = await  sails.sendNativeQuery('CALL firstTimePasswordSet($1, $2);' , [ inputs.password, inputs.user_id ])
               // sails.log(queryStatus.affectedRows);
                if(queryStatus.affectedRows){
                    sails.log("Query Succesfully executed");
                }
            }
            else {
                 sails.log("Error Second");
            }
        }
        catch (e) {
            console.error("Internal error ", e)
            }
  }


};
