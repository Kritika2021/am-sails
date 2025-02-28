"use strict";
const axios = require('axios').default;

class SendSMS{

    async sendOTPToUser(phoneNumber, username, otp){
        let smsURL = 'http://notify.forestallers.in/httpapi/otpapi?token=35251c9ff37a57fb3bb498157fe11dc4&number='+
                        ''+phoneNumber+'&sms=Hello, ' + username + ' OTP for login at astormihir.com is ' + otp +  
                        ' Your username is ' + phoneNumber + '.Regards Novateur Apps Studio OPC Pvt Ltd';
        let messageId = await axios.get(smsURL);
        return messageId.data;
    }

}

module.exports = new SendSMS();