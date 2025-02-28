const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");


module.exports = {


  friendlyName: 'Create admin',


  description: '',


  inputs: {

    admin_id:{
      type:'number',
    },   
    username:{
      type:'string'
    },
    email_id:{
      type:'string'
    },
    mobile_number:{
      type:'string'
    },
    admin_type:{
      type: 'string',
      isIn: [ 'ADMIN', 'SUPER_ADMIN' ]
    },
    is_deleted:{
      type:'boolean', defaultsTo:false
    },
    deleted_on:{
      type:'ref',
      columnType: 'datetime'
    },
    password:{
      type:'string'
    },
    profile_pic:{
      type:'string'
    },
    full_name:{
      type:'string'
    },
    fcm_token:{
      type:'string'
    },

  },


  exits: {

  },


  fn: async function (inputs) {

   
   if (utilities.validateInputExist(inputs.full_name) && utilities.validateEmail(inputs.email_id)
                    && utilities.validateMobileNumber(inputs.phone_number) && utilities.validateInput(inputs.admin_type) ) {
    let password = utilities.generatePassword(8);
    let encryptPassword = await sails.helpers.encryptPassword(password);
    
    let adminData = Admin.find( { id : inputs.admin_id , is_deleted : 0 });
     if(adminData.length > 0){
        this.res.status(responseCode.ServerErrors.Codes.USER_ALREADY_EXIST.error_code).send(responseCode.ServerErrors.Codes.USER_ALREADY_EXIST)

     if(adminData[0].admin_type == 'SUPER_ADMIN'){
          let recordAdmin = Admin.find({
                  or:
                   [ { email_id : inputs.email_id }, { mobile_number : inputs.mobile_number }, { username : inputs.email_id } ]  
          });
          sails.log(recordAdmin[0]);
          if(recordAdmin[0].id != null ) {
             if( recordAdmin[0].is_deleted == 1){
             // update query
                let updateRecord = await Admin.update({ id : inputs.admin_id })
                                            .set({
                                              full_name:inputs.full_name,
                                              username : inputs.username,
                                              is_deleted : 0,
                                              email_id : inputs.email_id,
                                              mobile_number: inputs.mobile_number,
                                              admin_type: inputs.admin_type,
                                              password : inputs.password
                                            });

               this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: updateRecord, success: 1 })
            }

            else{
              this.res.status(responseCode.ServerErrors.Codes.USER_ALREADY_EXIST.error_code).send(responseCode.ServerErrors.Codes.USER_ALREADY_EXIST)
            }
          }
          
    }
  }
  else{
            var createdAdmin = await Admin.create({   full_name:inputs.full_name,
                                                      username : inputs.username,
                                                      email_id : inputs.email_id,
                                                      mobile_number: inputs.mobile_number,
                                                      admin_type: inputs.admin_type,
                                                      password: inputs.password }).fetch();
            sails.log("insert" + createdAdmin);
            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: createdAdmin })
         }
  
}else{
    this.res.status(responseCode.ServerErrors.Codes.UNAUTHORISED.error_code).send(responseCode.ServerErrors.Codes.UNAUTHORISED);
}



  }


};
