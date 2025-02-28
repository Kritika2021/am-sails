class ServerErrors {}
class ServerSuccess {}

/* Data Related - Errors */

ServerErrors.BAD_REQUEST = {
  status: false,
  errorcode: 10003,
  error_message: "BAD REQUEST",
};
ServerErrors.Codes = {
  SAME_USER_SUCCESS: {
    status: true,
    error_code: 200,
    error_message: "SAME USER SUCCESS",
  },
    USER_NOT_EXIST: {
    status: false,
    error_code: 401,
    error_message: "USER DOES NOT EXIST",
  },
  SUCCESS: { status: true, error_code: 200, error_message: "SUCCESS" },
  NOT_FOUND: { status: false, error_code: 401, error_message: "NOT FOUND" },
  USER_NOT_FOUND: { status: false, error_code: 401, error_message: "USER NOT EXIST" },
  ADMIN_NOT_FOUND: { status: false, error_code: 401, error_message: "ADMIN NOT EXIST" },
  INVALID_CREDENTIALS: {
    status: false,
    error_code: 401,
    error_message: "INVALID CREDENTIALS",
  },
  UNAUTHORISED: {
    status: false,
    error_code: 401,
    error_message: "You are not authorised to do this action",
  },
  INTERNAL_ERROR: {
    status: false,
    error_code: 500,
    error_message: "Internal Server Error",
  },
  INVALID_THREAD: {
    status: false,
    error_code: 500,
    error_message: "Invalid Thread",
  },
  INVALID_PAYLOAD: {
    status: false,
    error_code: 400,
    error_message: "Bad Request",
  },
  INVALID_PASSWORD_LENGTH: {
    status: false,
    error_code: 400,
    error_message: "INVALID PASSWORD",
  },
  SESSION_EXPIRED: {
    status: false,
    error_code: 440,
    error_message: "SESSION EXPIRED",
  },

  INVALID_OTP: { status: false, error_code: 498, error_message: "INVALID OTP" },
    OTP_EXPIRED: { status: false, error_code: 440, error_message: "OTP EXPIRED" },
  OTP_NOT_MATCHING: {
    status: false,
    error_code: 498,
    message: "OTP NOT MATCHING",
  },
  INVITATION_EXPIRED: {
    status: false,
    error_code: 498,
    message: "INVITATION EXPIRED",
  },
  // OTP_EXPIRED:{status:false,error_code:440,error_message:"OTP_EXPIRED"},
  USER_ALREADY_EXIST: {
    status: false,
    error_code: 409,
    error_message: "USER ALREADY EXIST",
  },
  ADMIN_ALREADY_EXISTS: {
    status: false,
    error_code: 409,
    error_message: "ADMIN ALREADY EXISTS",
  },
  EMAILID_DOES_NOT_EXIST: {
    status: false,
    error_code: 409,
    error_message: "Admin does not exist with this emailId",
  },
  MESSAGE_ALREADY_EXIST: {
    status: false,
    error_code: 409,
    error_message: "MESSAGE ALREADY EXIST",
  },
  TAG_ALREADY_EXIST: {
    status: false,
    error_code: 409,
    error_message: "Tag already exist!",
  },
  TAG_IS_IN_USE: {
    status: false,
    error_code: 200,
    error_message: "This tag is using in rule, so can't delete it now!",
  },
  MESSAGE_IS_IN_USE: {
    status: false,
    error_code: 200,
    error_message: "This message is using in a rule, so can't be delete it!",
  },
  ORGANISATION_EXISTS: {
    status: false,
    error_code: 409,
    error_message: "ORGANISATION EXISTS",
  },
  USER_DEACTIVATED: {
    status: false,
    error_code: 403,
    error_message: "USER DEACTIVATED",
  },
  INVALID_EMAIL: {
    status: false,
    error_code: 422,
    error_message: "INVALID EMAIL",
  },
  EMAIL_NOT_REGISTER: {
    status: false,
    error_code: 422,
    error_message: "EMAIL NOT REGISTER",
  },
  PROFILE_NOT_UPDATED: {
    status: false,
    error_code: 417,
    error_message: "PROFILE NOT UPDATED",
  },
  NO_CHANGED: { status: false, error_code: 417, error_message: "NO CHANGE" },
  PASSWORD_NOT_RESET: {
    status: false,
    error_code: 417,
    error_message: "PASSWORD NOT RESET",
  },
  UNSUPPORTED_MEDIA_TYPE: {
    status: false,
    error_code: 415,
    error_message: "UNSUPPORTED MEDIA TYPE",
  },
  NO_CONTENT_IN_FILE: {
    status: false,
    error_code: 400,
    error_message: "NO CONTENT IN FILE",
  },
  INVALID_FILE_CONTENT: {
    status: false,
    error_code: 400,
    error_message: "INVALID FILE CONTENT",
  },
  PASSWORD_NOT_MATCHING: {
    status: false,
    error_code: 417,
    error_message: "PASSWORD NOT MATCHING",
  },
  PASSWORD_NOT_AVAILABLE: {
    status: false,
    error_code: 417,
    error_message: "Password is not set, Please try with OTP ",
  },
  DOMAIN_ALREADY_EXSITS: {
    status: false,
    error_code: 418,
    error_message: "DOMAIN ALREADY EXISTS",
  },
    PAYMENT_NOT_CREATED: {
        status: false,
        error_code: 418,
        error_message: "PAYMENT NOT CREATED",
    },
    REFUND_ALREADY_DONE:{status:false, error_code:409, error_message:"Refund has been already done!"},
    PAYMENT_PENDING:{status:false, error_code:418, error_message:"Payment pending!"},
    INVALID_NUMBER: { status: false, error_code: 401, success_message: "Invalid number"},
};

ServerSuccess.Codes = {
  SUCCESS: { status: true, success_code: 200, success_message: "SUCCESS" },
  USER_NOT_FOUND: { status: false, success_code: 498, success_message: "USER NOT FOUND" },
  SUCCESS_MAIL: {
    status: true,
    success_code: 200,
    success_message: "MAIL SENT SUCCESS",
  },
  SUCCESS_NEW_PASSWROD: {
    status: true,
    success_code: 200,
    success_message: "PASSWORD CHANGE SUCCESS",
  },
  ENTER_PASSWORD: {
    status: true,
    success_code: 200,
    success_message: "ENTER PASSWORD",
  },
  SUCCESS_LOGOUT: {
    status: true,
    success_code: 200,
    success_message: "LOGOUT SUCCESSFULL",
  },
  SUCCESS_DOMAIN: {
    status: true,
    success_code: 200,
    success_message: "Domain Available",
  },
  SUCCES_ACTIVATION: {
    status: true,
    success_code: 200,
    success_message: "ORGANISATION ACTIVATED YOUR EMAIL",
  },
    CONVERSATION_READ_SUCCESSFULLY:{status:true, success_message:"CONVERSATION READ SUCCESSFULLY"}
};

module.exports = { ServerErrors, ServerSuccess };
