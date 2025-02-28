const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities")



module.exports = {


  friendlyName: 'Forget password admin',


  description: '',


  inputs: {
    email_id:{
      type: 'string',
      isEmail: true
    }

  },


  exits: {

  },


  fn: async function (inputs) {

    if (utilities.validateEmail(inputs.email_id)) {
          let password = utilities.generatePassword(8);
          let encryptPassword = await sails.helpers.encryptPassword(password);
          // let data = await sails.sendNativeQuery('CALL checkAdminExistAndChangePassword($1, $2);' , [inputs.email_id, encryptPassword] );
          // sails.log(data);

          let adminRecord = await Admin.find({ email_id : inputs.email_id , is_deleted : 0 });
          sails.log(adminRecord[0]);

          if(adminRecord[0].admin_id!= null){
              let updateRecord = await Admin.update({ id: inputs.admin_id, is_deleted: 0 })
                                           .set({
                                              password: encryptPassword
                                            });
              this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: updateRecord, isSuccess : 1 });
          }
          else{
              this.res.status(responseCode.ServerErrors.Codes.EMAILID_DOES_NOT_EXIST.error_code).send(responseCode.ServerErrors.Codes.EMAILID_DOES_NOT_EXIST)
          }

   }
   else{
            this.res.status(responseCode.ServerErrors.Codes.EMAILID_DOES_NOT_EXIST.error_code).send(responseCode.ServerErrors.Codes.EMAILID_DOES_NOT_EXIST)
    }
}
};
