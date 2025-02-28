const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");


module.exports = {


  friendlyName: 'Edit admin',


  description: '',


  inputs: {
    full_name:{
      type:'string'
    },
    mobile_number:{
      type:'number'
    },
    admin_type:{
      type:'string',
      isIn: ['ADMIN', 'SUPER_ADMIN']
    },
    admin_id:{
      type:'number'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

    try {
            if (utilities.validateInputExist(inputs.admin_id)) {
            let adminRecord = await Admin.find({ id : inputs.admin_id , is_deleted : 0 });
              if(adminRecord[0].admin_type == 'SUPER_ADMIN' ){
                  let adminData = await Admin.find({ mobile_number : inputs.mobile_number ,  is_deleted : 0 }).fetch();

                  if(adminData[0].admin_id  !=  null   &&  adminData[0].admin_id != inputs.admin_id){
                    this.res.status(responseCode.ServerErrors.Codes.ADMIN_ALREADY_EXISTS.error_code).send(responseCode.ServerErrors.Codes.ADMIN_ALREADY_EXISTS);
                  }
                  else{
                    let updateData = Admin.update({ admin_id : inputs.admin_id })
                                          .set({
                                                full_name : inputs.full_name,
                                                mobile_number : inputs.mobile_number,
                                                admin_type: inputs.admin_type
                                              });
                    this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true });                      
                  }
               }
               else{
                console.log("Only Super Admin can take Edit option");

                this.res.status(responseCode.ServerErrors.Codes.UNAUTHORISED.error_code).send(responseCode.ServerErrors.Codes.UNAUTHORISED);
               }
           }
           else {
               this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD);
           }
        }
        catch (e) {
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
