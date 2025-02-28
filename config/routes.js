/**
 * Route Mappings
 * (sails.config.routes)
 *
 * Your routes tell Sails what to do each time it receives a request.
 *
 * For more information on configuring custom routes, check out:
 * https://sailsjs.com/anatomy/config/routes-js
 */

module.exports.routes = {

  /***************************************************************************
  *                                                                          *
  * Make the view located at `views/homepage.ejs` your home page.            *
  *                                                                          *
  * (Alternatively, remove this and add an `index.html` file in your         *
  * `assets` directory)                                                      *
  *                                                                          *
  ***************************************************************************/

  '/': { view: 'pages/homepage' },
  'POST /user/register'             :    { action : 'user/register' },
  

  'POST /confirm'                   :    { action : 'user/first-time-password-set' },
  'POST /user/query/nologin'        :    { action : 'user/ask-question-without-login' },
  'POST /user/login/otp'            :    { action : 'user/login-using-otp' },
  'POST /user/profile/get'          :    { action : 'user/profile-account-information' },
  'POST /user/profile/update'       :    { action : 'user/profile-update-save-changes' },
  'POST /user/login'                :    { action : 'user/get-user-profile' },
  'POST /user/login/password'       :    { action : 'user/user-login-with-password' },
  'POST /resend/otp'                :    { action : 'user/resend-otp' },
  'POST /confirm/user/registration' :    { action : 'user/confirm-user-registration' },
  'POST /register/settings'         :    { action : 'user/registration-settings' },
  'POST /firsttime/password/set'    :    { action: 'user/first-time-password-set' },
  'POST /update/user/profile/while/registering'    :    { action: 'user/update-user-profile-while-registering' },
  'POST /update/profile/picture'    :    { action: 'user/profile-picture-update' },

   

  // Admin Routes
 'POST /admin/create'                :    { action : 'admin/create-admin' },
 'POST /admin/login'                :    { action : 'admin/login' },
 'POST /admin/forget/password'      :    { action : 'admin/forget-password-admin' },
 'POST /admin/profile/update'       :    { action : 'admin/profile-update-for-admin' },
 'POST /edit/admin'                 :    { action : 'admin/edit-admin' },
 //'POST /lists/?'                      :    { action : 'user/pet' },

 'POST /user/lock/unlock/by/admin'             : { action : 'user/user-lock-unlock'},
 'POST /get/admin/lock/unlock/log/:adminId/:page' :  { action : 'admin/get-user-lock-unlock-by-admin-log'},
 'POST /get/admin/list/:page'                          :  { action : 'admin/get-admin-lists'},
 'POST /get/admin/payment/request/log/:adminId/:page'  :  { action : 'admin/get-admin-payment-request-log'},
 'POST /get/admin/conversation/log/:adminId/:page'  :  { action : 'admin/get-admin-conversation-media-log'},



 // Rules/ Message
 'POST /create/predefined/message'               :    { action : 'rules/create-predefined-message' },
 'POST /update/predefined/message'               :    { action : 'rules/update-predefined-message' },
 'POST /create/new/tag'                          :    { action : 'rules/create-tag' },
 'POST /delete/tag'                              :    { action : 'rules/delete-tags' },
 'POST /get/prdefined/messages'                  :    { action : 'rules/get-prdefined-messages' },
 'POST /get/tags/list'                           :    { action : 'rules/get-tags-list' },
 'POST /delete/predefined/messages'              :    { action : 'rules/delete-predefined-messages' },
 'POST /get/rule/by/ruleid/:ruleid'              :    { action : 'rules/get-rule-by-rule-id' },
 'POST /get/all/rules'                           :    { action : 'rules/get-all-rules' },
 'POST /update/rules'                            :    { action : 'rules/update-rules' },
 'POST /delete/rules'                            :    { action : 'rules/delete-rules' },
 'POST /get/message/by/tags'                     :    { action : 'rules/get-message-by-tags' },
 'POST /create/new/rule'                         :    { action : 'rules/create-rules' },


// OTP
 'POST /get/otp/logs'                             :    { action : 'user/otp-logs' },
 'POST /otp/verification'                         :    { action : 'user/otp-verification' },

// Query
 'POST /ask/query/after/login'                    :    { action : 'query/ask-query-after-login' },
 'POST /admin/conversation/userprofile'           :    { action : 'query/admin-conversation-user-profile' },
 'POST /get/all/user/attachments'                 :    { action : 'query/get-all-user-attachments' },
 'POST /get/sent/and/received/attachments'        :    { action : 'query/get-sent-and-received-attachments' },
 'POST /get/query/list/for/user/:page'            :    { action : 'query/get-query-list-for-user' },

 'POST /get/user/conversation/by/query/thread/:id/:page'   :    { action : 'query/get-user-conversation-by-query-thread' },
 'POST /get/user/unread/query/conversation'       :    { action : 'query/get-user-unread-query-conversation-for-notification' },
 'POST /read/users/conversation/by/admin/of/query/thread/:id'       :    { action : 'query/read-users-conversation-by-admin-of-query-thread' },
 'POST /read/users/conversation/by/user/of/query/thread/:id'       :    { action : 'query/read-users-conversation-by-user-of-query-thread' },
 'POST /get/customers/list/:page'                 :  { action : 'query/get-customer-list' },
 'POST /admin/query/list'                         :  { action : 'query/query-list'},  
 'POST /add/new/query/conversation/chat/by/user'  :  { action : 'query/add-new-query-conversation-chat-by-user'},  
 'POST /add/new/query/conversation/chat/by/admin' :  { action : 'query/add-new-query-conversation-chat-by-admin'},  
 // Need to recheck it.
 'POST /admin/message'                            :  { action : 'query/message'},  
 'POST /admin/message/conversation'               :  { action : 'query/message-conversation'},  

 // Payment
 'POST /create/payment'                           :  { action : 'payment/create-payment'},  
 'POST /get/payment/list/for/admin/:page'         :  { action : 'payment/get-payment-completed-list'},  
 'POST /get/refund/amount/:id'                    :  { action : 'payment/refund-amount'},  
 'POST /check/payment/status'                     :  { action : 'payment/check-payment-status'},  
 'POST /get/payment/list/in/user/:page/:id'       :  { action : 'payment/get-payment-for-user'},  
 'POST /get/transaction/list/in/user'             :  { action : 'payment/transaction-list-in-thread'},  


 // DASHBOARD
 'POST /get/dashboard/items'                      :    { action : 'dashboard/get-dashboard-item' },
 'POST /get/dashboard/graph'                      :    { action : 'dashboard/get-dashboard-graph' },
 

//======================================================================================================================
//          PAYMENT WEB HOOK REPORT
//======================================================================================================================
 'POST /user/payment/callback/web_hook'           :    { action : 'payment/get-payment-report-by-webhook'},




// Testing purpose
 'POST /get/pets'                                 :    { action : 'user/pet' },
 'POST /home'                                     :    { action : 'home'},

 

 
  /***************************************************************************
  *                                                                          *
  * More custom routes here...                                               *
  * (See https://sailsjs.com/config/routes for examples.)                    *
  *                                                                          *
  * If a request to a URL doesn't match any of the routes in this file, it   *
  * is matched against "shadow routes" (e.g. blueprint routes).  If it does  *
  * not match any of those, it is matched against static assets.             *
  *                                                                          *
  ***************************************************************************/
  
 // 'POST /confirm/user/register' :  { action: 'user/confirmUserRegistration' },
//  'POST /redisCheck' :             { action: 'rediscode' },
  //'POST /redisfetchdata' :             { action: 'fetchdata' },
//'POST /confirm/user/register' :  { action: 'user/confirmUserRegistration' },
   //router.post("/user/firsttime/password/set", sessionValidator.validateConsumerWebSession, loginController.firstTimePasswordSet);
  //'GET /pwdset' :  { action: 'firstTimePasswordSet' },

};
