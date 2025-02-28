module.exports = {


  friendlyName: 'Generate and get otp',


  description: '',


  inputs: {
    otpLength : {
      type: 'number',
      size : 4
    }

  },


  exits: {

    success: {
      description: 'OTP generated success',
    },
    error :{
      description : "An error occured while genererating otp",
    }

  },


  fn: async function (inputs, exits) {

    //sails.log(inputs.otpLength);
    // TODO
    let generatedCode = Math.floor(Math.pow(10, inputs.otpLength - 1) + Math.random() * (Math.pow(10, inputs.otpLength) - Math.pow(10, inputs.otpLength - 1) - 1));
    sails.log(generatedCode);
    if (generatedCode !== undefined) {
      //sails.log(generatedCode);
         return exits.success (generatedCode);
    }
    else {
        return exits.error(null);
    }

  
}

};

