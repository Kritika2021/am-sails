  custom:{
       // PAYMENT VARIABLE
        PAYMENT_LINK_URL:"https://api.razorpay.com/v1/payment_links",
        TEST:{
            USER_NAME: "rzp_test_tfPcVeJJty1FJm",
            PASSWORD: "oWVEx3DzmrTDdChlRt040dbh",
            CALLBACK_URL:"http://65.1.79.103:8000/home",
            CALLBACK_URL_PROFILE: "http://65.1.79.103:8000/profile?success=true"
        },
        // PROD:{
        //     USER_NAME: "rzp_live_T7wSMejo3d3F96",
        //     PASSWORD: "LbBZ8mgcjVGJ9z2sPQg9YXF2",
        //     CALLBACK_URL:"https://app.astromihir.com/home",
       
    },


    AWS_S3_CONFIG : {
        accessKeyId: "AKIA56ZWTA6TAFKOJ2DY",//"AKIAZQDTWSN6ZFARHSJF",//"AKIATENDTZNWPUAXYCNW",
        secretAccessKey: "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",//"DPs9WsSd1evZq9wFEM9xvApkouc039bfVfQPcuNK",//"eqLXHDDIvd/UDW7KirOtfk96V6X3aki/BbZrUVav",
        adapter: require('skipper-s3'),
        region: "us-east-1",
        bucket: "am-sails",
        poolId: "ap-south-1:792a7018-2791-4383-b14c-48841ad570fc",
        user_profile_pic:"user_profile_pic",
        conversation_media:"conversation_media",
        admin_profile_pic:"admin_profile_pic",

        MAIN_FOLDER:function(running_host){
            if(running_host == 0){
                return 'staging_storage';
            }
            else if(running_host == 1){
                return 'test_storage';
            }
            else if(running_host == 2){
                return 'local_storage';
            }
            else{
                return 'production_storage';
            }

        },