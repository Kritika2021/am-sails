
const moment=require('moment');

module.exports = {


  friendlyName: 'Otp logs',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs) {

    
    // var timestring1 = now().toUTCSTring();
    // console.log(timestring1);
    //var isoDateString = new Date();
    //console.log(isoDateString);
    let dt = new Date();
    let createdData = dt.toISOString();
    console.log(createdData);
    
    dt.setHours(dt.getHours() + 2);
    let updateData =  dt.toISOString();
    console.log(updateData);

    // var timestring2 = "2013-05-09T02:00:00Z";
    // var startdate = moment(timestring1);
    // var expected_enddate = moment(timestring2);
    // var returned_endate = moment(startdate).add(2, 'hours');  // see the cloning?
    // console.log(returned_endate.isSame(expected_enddate))  // true



    //  var timestring1 = "2013-05-09T00:00:00Z";
    //  var timestring2 = "2013-05-09T02:00:00Z";
     // var val = moment();
     // console.log(val);
    //  var val = moment.utc().format(dd);
     // console.log(val);
     // var startdate = moment(timestring1);
     // console.log(startdate);
     // var expected_enddate = moment(timestring2);
     // var returned_endate = val.add(2, 'hours');  // see the cloning?
     // console.log(returned_endate);
     // console.log(returned_endate.isSame(expected_enddate));  // true

    // var a = moment();
    // var b = moment.utc();
    // a.format("YYYY-MM-DD HH:M:S");  // 2013-02-04T10:35:24-08:00
    // b.format();  // 2013-02-04T18:35:24+00:00

    // console.log(a);
    // console.log(b);
  }


};
