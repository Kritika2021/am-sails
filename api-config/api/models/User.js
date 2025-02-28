/*
 * User.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {

    //  ╔═╗╦═╗╦╔╦╗╦╔╦╗╦╦  ╦╔═╗╔═╗ß
    //  ╠═╝╠╦╝║║║║║ ║ ║╚╗╔╝║╣ ╚═╗
    //  ╩  ╩╚═╩╩ ╩╩ ╩ ╩ ╚╝ ╚═╝╚═╝
    
    full_name :{
      type: 'string',
     },

    username :{
      type: 'string',
      description: 'The name of user',
      required :true,
      unique :true,
    },

    email_id :{
      type: 'string',
      description: 'Email address of an user',
      required :true,
      unique :true,
    },

    mobile_number :{
      type: 'string',
      required :true,
      unique :true,
    },

    password : {
      type: 'string',
      //required :true,
    },

    country_code: {
      type: 'string',
      description: 'Country code',
      required :true,
    },

    is_mobile_number_verified :{
      type: 'boolean', defaultsTo: false,
    },

    is_email_verified :{
      type: 'boolean', defaultsTo: false,
    },

    is_locked :{
      type: 'boolean', defaultsTo: false,
    },

    birth_date_time :{
       type: 'ref', columnType: 'timestamp' 
    },

    birth_date :{
      type: 'string',
      //required :true,
    },

    birth_time :{
      type: 'string',
    },

    birth_place :{
      type: 'string',
      //required :true,
    },

    birth_address :{
      type: 'string',
      //required :true,
    },

    registered_on :{
       type: 'ref', columnType: 'timestamp' 
    },

    profile_pic :{
       type: 'string' ,
      //columnType:'file'
    },

    gender :{
        type: 'string',
        isIn: [ 'M', 'F' ]
    },

    timezone :{
       type: 'string',
    },
    
    latitude :{
      type: 'string',
    },

    longitude :{
      type: 'string',
    },

    mobile_verified_on :{
       type: 'ref', columnType: 'timestamp' 
    },

    registration_type :{
      type: 'string',
      isIn: [ 'FREE', 'PAID' ]
    },

    payment_status :{
      type: 'string',
    },

    payment_relation_id :{
      type : 'string', 
    },

    locked_by :{
      type: 'number',
      columnType : 'bigint'
    },

    fcm_token :{
      type : 'string'
    },
    createdAt: { type: 'ref', columnType: 'datetime', autoCreatedAt: true, },
    updatedAt: { type: 'ref' , columnType: 'datetime', autoUpdatedAt: true, },
   
    // otpValue:{
    //   type: 'ref',
    //   columnType:'integer'
    // },
    // is_admin:{
    //   type: 'boolean', defaultsTo : false
    // },
    
   
    //  ╔═╗╔╦╗╔╗ ╔═╗╔╦╗╔═╗
    //  ║╣ ║║║╠╩╗║╣  ║║╚═╗
    //  ╚═╝╩ ╩╚═╝╚═╝═╩╝╚═╝


    //  ╔═╗╔═╗╔═╗╔═╗╔═╗╦╔═╗╔╦╗╦╔═╗╔╗╔╔═╗
    //  ╠═╣╚═╗╚═╗║ ║║  ║╠═╣ ║ ║║ ║║║║╚═╗
    //  ╩ ╩╚═╝╚═╝╚═╝╚═╝╩╩ ╩ ╩ ╩╚═╝╝╚╝╚═╝

    

  },

};

