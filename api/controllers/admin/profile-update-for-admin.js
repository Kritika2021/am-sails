
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");

module.exports = {


  friendlyName: 'Profile update for admin',


  description: '',


  inputs: {
    full_name:{
      type:'string',
    },
    mobile_number:{
      type:'number'
    },
    password:{
      type:'string'
    },
    admin_id:{
      type:'number'
    }
  },


  exits: {

  },


  fn: async function (inputs) {
    try{
           if (utilities.validateInput(inputs.full_name) && utilities.validateMobileNumber(inputs.mobile_number)){
              if (utilities.validateInput(inputs.password)) {
                 if (utilities.validatePassword(inputs.password)) {
                   let encryptPassword = await sails.helpers.encryptPassword(inputs.password);


                   let adminRecord = await Admin.find({ mobile_number : inputs.mobile_number , is_deleted : 0 });
                   sails.log(adminRecord.length);

                   if(adminRecord.length == 0 ){
                    // if( adminRecord[0].id != null && adminRecord[0].id != inputs.admin_id){
                    //    sails.log("test");
                       this.res.status(responseCode.ServerErrors.Codes.ADMIN_NOT_FOUND.error_code).send(responseCode.ServerErrors.Codes.ADMIN_NOT_FOUND);
                    //}
                   }
                   else{    
                          sails.log("Admin Exists");

                          sails.log(inputs.password);
                          // Update Record when password is null
                          if(inputs.password == null){
                              let updateRecord = await Admin.update({ id : inputs.admin_id })
                                                            .set(
                                                                 { full_name : inputs.full_name,
                                                                   mobile_number : inputs.mobile_number
                                                                 }
                                                              );
                              if(updateRecord){
                                   this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });  
                              }
                              else{
                                   this.res.status(responseCode.ServerErrors.Codes.ADMIN_ALREADY_EXISTS.error_code).send(responseCode.ServerErrors.Codes.ADMIN_ALREADY_EXISTS)
                              }
                          }else{
                               // update record when password is not null
                              let updateRecord = await Admin.update({ id : inputs.admin_id })
                                                          .set(
                                                               {  
                                                                 full_name : inputs.full_name,
                                                                 mobile_number : inputs.mobile_number,
                                                                 password : inputs.password 
                                                               }
                                                              ).fetch();
                            
                              if(updateRecord){
                                   this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });  
                              }
                              else{
                                   this.res.status(responseCode.ServerErrors.Codes.ERROR.error_code).send({ status: false});
                              }  
                        }

                  } 
              }else{
                       this.res.status(responseCode.ServerErrors.Codes.INVALID_PASSWORD_LENGTH.error_code).send(responseCode.ServerErrors.Codes.INVALID_PASSWORD_LENGTH)   
                } 
         }else{
                       this.res.status(responseCode.ServerErrors.Codes.INVALID_PASSWORD_LENGTH.error_code).send(responseCode.ServerErrors.Codes.INVALID_PASSWORD_LENGTH)   
              } 
     }  else{
              this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
           }
          

     }// end of try
     catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }


  }


};
