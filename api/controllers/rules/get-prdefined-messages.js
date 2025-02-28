
const responseCode = require("../../globals/apiResponse");
const utilities = require("../../globals/utilities");
const constants = require("../../globals/constants");

module.exports = {


  friendlyName: 'Get prdefined messages',


  description: '',


  inputs: {
    search_text:{
      type:'string'
    },
    page:{
      type:'number'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

    try {
           
            if (utilities.validateInput(inputs.search_text)) {
                inputs.search_text = "%" + inputs.search_text + "%"
            }
            else {
                inputs.search_text = null;
            }
            if (!utilities.validateInput(inputs.page)) {
                inputs.page = 1
            }
            let offset_value = (inputs.page - 1) * constants.pageConstants.pageLength;

            // ToDo 
            // IF(search_text IS NULL) THEN
            //     SELECT pm.message_content,pm.messageId 
            //     FROM predefined_messages AS pm
            //     WHERE  pm.is_deleted = 0 
            //     ORDER BY pm.created_on DESC 
            //     LIMIT limit_number OFFSET offset_number;
            // ELSE
            //     SELECT pm.message_content,pm.messageId FROM predefined_messages AS pm
            //     WHERE pm.message_content LIKE search_text AND pm.is_deleted = 0 
            //     ORDER BY pm.created_on DESC 
            //     LIMIT limit_number OFFSET offset_number;
            // END IF;


            // ToDo
            let query ='';

            if(inputs.search_text == null){
                query = await Predefined_messages.find({
                    is_deleted : 0
                }).sort( [{createdAt : 'DESC'}] )
                  .limit(constants.pageConstants.pageLength).skip(offset_value);
            }
            else{
                 query = await Predefined_messages.find({
                    is_deleted : 0,
                    message_content : inputs.search_text
                }) .sort([{ createdAt : 'DESC' }])
                  .limit(constants.pageConstants.pageLength).skip(offset_value);

                 // sails.log(query);
            }


           // sails.log(query.rows[0]);


            //let PredefinedMessage = await sails.sendNativeQuery('CALL get_predefined_messages ($1, $2, $3);', ([inputs.search_text, constants.pageConstants.pageLength, offset_value]) );
            this.res.status(responseCode.ServerSuccess.Codes.SUCCESS.success_code).send({ status: true , data : query });
        }
        catch (e) {
            console.error("Internal error ", e)
            this.res.status(responseCode.ServerErrors.Codes.INTERNAL_ERROR.error_code).send(responseCode.ServerErrors.Codes.INTERNAL_ERROR);
        }

  }


};
