/**
 * Module dependencies
 */

// ...
const multiparty = require('multiparty');

/**
 * query/test-multiparty.js
 *
 * Test multiparty.
 */
module.exports = async function testMultiparty(req, res) {

 //console.log(req);

  let form = new multiparty.Form();
  //console.log(form);

            let formValue = await new Promise(function (resolve, reject) {
                form.parse(req, function (err, fields, files) {
                    if (err) {
                        reject(err);
                    }
                    else {
                        let formData = { fields: fields, files: files };
                        resolve(formData);
                    }
                });
            });
            let files = formValue.files.file;
            console.log(files);


};
