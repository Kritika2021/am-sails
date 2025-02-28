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


 // DASHBOARD
 'POST /get/dashboard/items'                      :    { action : 'dashboard/get-dashboard-item' },
 'POST /get/dashboard/graph'                      :    { action : 'dashboard/get-dashboard-graph' },
 

 'POST /get/pets'                                 :    { action : 'user/pet' },
 'GET /hello'                                    :    { action : 'socket/create-socket'},

 

 
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
