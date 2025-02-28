const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");

module.exports = {


  friendlyName: 'Login',


  description: 'Login admin.',


  inputs: {
    username:{
      type:'string'
    },
    password:{
      type:'string'
    }

  },


  exits: {

  },


  fn: async function (inputs) {

     try {
            
            if (utilities.validateInput(inputs.username) && utilities.validateInput(inputs.password)) {
                let adminResult = await Admin.find({ username : inputs.username , is_deleted : 0 }); 
                console.log(adminResult[0]); 
                if (adminResult[0]) {

                    let recordPassword = adminResult[0].password;
                   //console.log(recordPassword);

                    let comparePasswordResult = await utilities.comparePassword(inputs.password, recordPassword)
                    if (comparePasswordResult) {
                        // admin = adminResult[0][0]
                        // delete admin["password"];
                        // let sessionKey = admin.admin_id + "_admin_session";
                        // let sessionId = await utilities.encryptSession(sessionKey);
                        // await redisClient.set(sessionId, JSON.stringify(admin));
                        // admin.sessionId = sessionId;
                        //FCM
                       // await loginBA.updateFCMtokenBA(reqData.fcm_token,admin.admin_id)
                        this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true, data: adminResult[0] });
                    }
                    else {
                        this.res.status(responseCode.ServerErrors.Codes.INVALID_CREDENTIALS.error_code).send(responseCode.ServerErrors.Codes.INVALID_CREDENTIALS);
                    }
                }
                else {
                    this.res.status(responseCode.ServerErrors.Codes.ADMIN_NOT_FOUND.error_code).send(responseCode.ServerErrors.Codes.ADMIN_NOT_FOUND);
                }
            }
            else {
                this.res.status(responseCode.ServerErrors.Codes.INVALID_PAYLOAD.error_code).send(responseCode.ServerErrors.Codes.INVALID_PAYLOAD)
            }
        }
        catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
