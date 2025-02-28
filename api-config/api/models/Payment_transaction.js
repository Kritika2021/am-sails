/**
 * Payment_transaction.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {

    //  ╔═╗╦═╗╦╔╦╗╦╔╦╗╦╦  ╦╔═╗╔═╗
    //  ╠═╝╠╦╝║║║║║ ║ ║╚╗╔╝║╣ ╚═╗
    //  ╩  ╩╚═╩╩ ╩╩ ╩ ╩ ╚╝ ╚═╝╚═╝
   
    user_id:{
      model:'User'
    },
    admin_id:{
      model:'Admin'
    },
    conversation_thread_id:{
      model:'Questions_threads'
    },
    chat_id:{
      model:'Question_conversations'
    },
    amount:{
      type:'number'
    },
    GST:{
      type:'number'
    },
    total_amount:{
      type:'number'
    },
    currency_code:{
      type:'string'
    },
    currency_symbol:{
      type:'string'
    },
    additional_notes:{
      type:'string'
    },
    short_url:{
      type:'string'
    },
    payment_relation_id:{
      type:'string'
    },
    payment_link_id:{
      type:'string'
    },
    payment_id:{
      type:'string'
    },
    order_id:{
      type:'string'
    },
    payment_method:{
      type:'string'
    },
    payment_status:{
      type:'string'
    },
    paid_on:{
      type:'string'
    },
    refund_id:{
      type:'string'
    },
    refund_entity:{
      type:'string'
    },
    refund_amount:{
      type:'number'
    },
    refund_on:{
      type:'string'
    },
    payment_for:{
      type:'string'
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

