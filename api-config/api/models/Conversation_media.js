/**
 * Conversation_media.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {

    //  ╔═╗╦═╗╦╔╦╗╦╔╦╗╦╦  ╦╔═╗╔═╗
    //  ╠═╝╠╦╝║║║║║ ║ ║╚╗╔╝║╣ ╚═╗
    //  ╩  ╩╚═╩╩ ╩╩ ╩ ╩ ╚╝ ╚═╝╚═╝
     // media_id PK
     
     conversation_id:{
      model:'Question_conversations'
     },
     media_url:{
      type:'string'
     },
     is_deleted:{
      type: 'boolean', defaultsTo: false,
     },
     media_type:{
      type:'string'
     },
     media_subtype:{
      type:'string'
     },
     deleted_on:{
      type: 'ref', columnType:'datetime',
     },
     added_by:{
      model:'Admin'
     },
     user_type:{
      type:'string'
     },
     
     file_name:{
      type:'string'
     },
     file_size:{
      type:'string',
     },
     createdAt: { type: 'ref', columnType: 'datetime', autoCreatedAt: true, },
     updatedAt: { type: 'ref' , columnType: 'datetime', autoUpdatedAt: true, },
   

    //  ╔═╗╔╦╗╔╗ ╔═╗╔╦╗╔═╗
    //  ║╣ ║║║╠╩╗║╣  ║║╚═╗
    //  ╚═╝╩ ╩╚═╝╚═╝═╩╝╚═╝


    //  ╔═╗╔═╗╔═╗╔═╗╔═╗╦╔═╗╔╦╗╦╔═╗╔╗╔╔═╗
    //  ╠═╣╚═╗╚═╗║ ║║  ║╠═╣ ║ ║║ ║║║║╚═╗
    //  ╩ ╩╚═╝╚═╝╚═╝╚═╝╩╩ ╩ ╩ ╩╚═╝╝╚╝╚═╝

  },

};

