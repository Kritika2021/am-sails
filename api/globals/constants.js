class Constants{}

Constants.OTP_STORE_TIME_LIMIT    =   60 * 10 ;//10 Minutes
Constants.OTP = {
	otpLength : 4,
	defaultOtp: 9988
};

Constants.FILE_SIZE = 1024;
Constants.GST_PERCENT = 18;


Constants.STATUS_EXPIRED = 'Expired';
Constants.STATUS_ACTIVE = 'Active';


Constants.pageConstants = {
	pageLength : 20, // check,
	defaultPage:1
};
Constants.userTypes = {
	ADMIN:"ADMIN",
	USER:"USER"
};

Constants.adminTypes = {
	SUPER_ADMIN:"SUPER_ADMIN",
	SUB_ADMIN:"SUB_ADMIN"
};


Constants.constantStrings = {
	admin: {
		name: "admin",
		email: "admin@admin.com"
	},
	confirmEmails: {
		from : "no-reply@test-app.com"
	},
	WEB:'web'
};

Constants.Session = {
	otp_prefix : 'otpKey_'
};

Constants.Registration = {
	message:"User successfully registered"
};

Constants.RunningService = {
	Service: "Track flow Authentication Service",
	Status: "RUNNING"
};

Constants.PasswordMessages = {
	message:"Password did not match"
};

Constants.NotFound = {
	message:"Not Found"
};

Constants.DemoMails = ['harikrishnan@synclovis.com'];

Constants.ApiInspectorMessages ={
	pinNumber :"_pinNumber",
	expiryTimer:60
};

Constants.EmailSender = {
	FROM:'"Trackflow" <no-reply@trackflow.ai>'
};
Constants.KeyWords = {
	find:"find",
	web:'web'
}

Constants.InviteAccept = {
	ACCEPTED:'ACCEPTED',
	UpdatePassword:'UPDATED_USERS_PASSWORD'
}

Constants.ForgetPasswordMessages = {
	otpNumber:"_otpNumber",
	expiryTimer:180,
	InsertPasswordMessage:"NEW_PASSWORD_INSERTED"
};

Constants.InsertUserRegistrationMessages = {
	messageUserAlreadyExisted:"USERS_ALREADY_EXISTS",
	messageUserInserted:"USER_ADDED_SUCCESSFULLY",
	messageUserInsertedNotOrganisation: "USERS_ADDED_SUCCESSFULLY_BUT_NOT_ORGANISATION",
	USER_ALREADY_EXISTS: "USER_ALREADY_EXISTS",
	ORGANISATION_EXISTS: "ORGANISATION_EXISTS",
	USER_DEACTIVATED:"USER_DEACTIVATED"
};

Constants.AccountType = {
	basic:"Basic",
	pro:"Pro",
	enterprise:"Enterprise"
};

Constants.WEB_HOOK = {
	USER_PAYMENT:"/user/payment/callback/web_hook"
};

Constants.MAIL_CONFIG = {
    host: "mail.synclovis.com",
    auth: {
        user: "akshay.kumar@synclovis.com",
        pass: "Akshay@123"
    },
    email: 'gk@novateur.app'
};

Constants.PAYMENT_STATUS = {
	CAPTURE:"CAPTURED",
	FAILED: "FAILED"
};

Constants.FILTER = {
	NO_REPLY: "NO_REPLY",
	RESPONSE_PENDING: "RESPONSE_PENDING",
	RESPOND: "RESPOND"
}

Constants.SENDGRID = {
	//API_KEY: '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',
	API_KEY: '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',
	//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


}
// socket
Constants.SOCKET_EVENTS = {
	CONNECT: "connect",
	CONNECTION: "connection",
	SOCKET_ERROR: "socket_error",
	API_KEY_MISSING: "socket_error",
	UNAUTHORIZED: "unauthorized",
	SUCCESS:"success",
	//USE here
	NEW_QUERY_CONVERSATION_BY_ADMIN: "new_query_conversation_by_admin",
	NEW_QUERY_CONVERSATION_BY_USER: "new_query_conversation_by_user",
	ASK_QUERY_AFTER_LOGIN: "ask_query_after_login",
	CREATE_PAYMENT: "create_payment",
	USER_PAYMENT_COMPLETE: "user_payment_complete",
	THREAD_DETAIL_USER: "thread_detail_user",
	THREAD_DETAIL_ADMIN: "thread_detail_admin",
	USER_REFUND: "user_refund_amount_user",
	USER_REFUND_ADMIN: "user_refund_amount_admin",


};

Constants.SOCKET_ERRORS = {
	AUTHTOKEN_MISSING: "AUTHTOKEN_MISSING",
	USERTYPE_MISSING: "USERTYPE_MISSING",
	INVALID_PAYLOAD: "INVALID_PAYLOAD",
	INTERNAL_ERROR: "INTERNAL_ERROR",
	UNAUTHORIZED: "UNAUTHORIZED",
	INVALID_API_KEY: "INVALID_API_KEY",
	INVALID_PACKAGE_NAME: "INVALID_PACKAGE_NAME",
	UNKNOWN_USER: "UNKNOWN_USER",
	NO_ACTIVE_SESSION_AVAILABLE: "NO_ACTIVE_SESSION_AVAILABLE",
	AUTHORIZED: "AUTHORIZED",
	SUCCESS:"SUCCESS"
}

Constants.SOCKET = {
	AUTHORIZED: "authorized",
	SUCCESS:"SUCCESS",
};

Constants.notifications_title = {
	TITLE:"NEW MESSAGE ARRIVED",
	//NEW_THREAD:"New Thread Created",
	//NEW_MESSAGE_FROM_USER_TITLE:"New Message Arrived",
	NEW_THREAD:"Query from ",
	NEW_MESSAGE_FROM_USER_TITLE:"Message from ",
	//NEW_MESSAGE_FROM_ADMIN_TITLE:"Astro Mihir Team Respond Your Query ",
	NEW_MESSAGE_FROM_ADMIN_TITLE:"Response ",
	//NEW_PAYMENT_CREATE_TO_USER:"Requested For Payment",
	NEW_PAYMENT_CREATE_TO_USER: "Fee Request",
	USER_PAYMENT:"Payment Complete",
	USER_LOCK_TITLE:"User Locked",
	USER_UNLOCK_TITLE:"User Unlocked",
	PAID_QUERY:"Paid Query from ",
	FREE_QUERY:"Query from ",
	REFUND_RS :"Refunded Rs ₹",
	
};

Constants.notifications_message = {
	THREAD_CREATED_MESSAGE: " created a new thread",
	NEW_MESSAGE_FROM_USER:" sent a message",
	NEW_MESSAGE_FROM_ADMIN:" New message received from Astro Mihir team ",
	//PAYMENT_MESSAGE:" Astro Mihir team requested for payment of ₹",
	PAYMENT_MESSAGE: " requested by AstroMihir team",
	USER_PAYMENT_MESSAGE:" made a payment of ₹",
	USER_LOCK_MESSAGE:" Astro Mihir team LOCKED you",
	USER_UNLOCK_MESSAGE:" Astro Mihir team UN-LOCKED you",
	ATTACHMENT:"1 attachment received ",
	REFUND_MESSAGE:"Payment will be received in next 8-10 working days.",
	
};

Constants.notify_about = {
	NEW_THREAD_CREATED:"NEW_THREAD_CREATED",//this for only admin
	NEW_MESSAGE_CREATED_FROM_USER:"NEW_MESSAGE_CREATED_FROM_USER ",//admin
	NEW_MESSAGE_CREATED_FROM_ADMIN:"NEW_MESSAGE_CREATED_FROM_ADMIN",//user
	PAYMENT_NOTIFY:"PAYMENT_NOTIFY ",//user
	PAYMENT_COMPLETE_NOTIFY:"PAYMENT_COMPLETE_NOTIFY ",//admin
	USER_LOCK_NOTIFY:"USER_LOCK_NOTIFY",//user
	USER_UNLOCK_NOTIFY:"USER_UNLOCK_NOTIFY",//user
	ATTACHMENT_NOTIFY:"ATTACHMENT_NOTIFY",
	PAID_QUERY_NOTIFY:"PAID_QUERY_NOTIFY",
	FREE_QUERY_NOTIFY:"FREE_QUERY_NOTIFY",
	REFUND_AMOUNT:"REFUND_AMOUNT",

};


module.exports = Constants;


