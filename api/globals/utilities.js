//let config = require('../config/config');
let AWS = require('aws-sdk');
const bcrypt = require('bcrypt');
const saltRounds = 13;
let sha1 = require("sha1");

let moment = require('moment');
AWS.config.update(sails.config.AWS_S3_CONFIG);



exports.validateInput = function (data) {
    return !!(data && data !== '');
};

exports.validatePassword = function (password) {
    if (password.length < 7) {
        return false;
    }
    return true;
};

exports.validateFieldData = function (data) {
    return !(!data || data == "" || data == null);
};

exports.validateInputExist = function (data) {
    return data != null && data != undefined && data != '';
};
exports.validateNumber = function(data){
    return data >=0;
};

exports.validateMobileNumber = function(mobile_number){
  var regex = /^\d{10}$/;
  return true;
  //return regex.match(mobile_number);
};

exports.validateEmail = function(email) {
    if(!email) return false;

    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
};

exports.validatePassword = function (password) {
    if (password.length < 7) {
        return false;
    }
    return true;
};

exports.comparePassword = async (password,encryptedPassword)=>{
    return await bcrypt.compare(password, encryptedPassword);
};

exports.generatePassword = function (length) {
    var randPassword = Array(length).fill("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*?").map(function(x) { return x[Math.floor(Math.random() * x.length)] }).join('');
    if (randPassword !== undefined) {
        return randPassword;
    }
    else {
        return null;
    }
};

exports.encryptPassword = async (password)=>{
    return await bcrypt.hash(password,saltRounds);
};

exports.getS3BucketInstance = function () {
    return new AWS.S3({params: {Bucket: sails.config.AWS_S3_CONFIG.bucket}});
};




