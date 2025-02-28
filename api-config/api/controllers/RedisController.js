/**
 * RedisControllerController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

var util = require('util');

module.exports = async function redisCall(req, res){
  


// module.exports = function signup(req, res) {

//   sails.log.debug('TODO: implement');
//   return res.ok();

// };



// Made up a fake parameter:
var ccc = 'foo';

// Inspired by https://github.com/node-machine/driver-interface/blob/06776813ff3a29cfa80c0011f3affa07bbc28698/layers/cache/get-cached-value.js
// Redis client docs: https://github.com/NodeRedis/node_redis/tree/v.2.8.0#sending-commands
// See also https://github.com/sailshq/machinepack-redis/blob/f0892e581286eac24757532513387162396356f7/machines/get-cached-value.js#L79-L94
// > If Redis returns `null`, then the value at this key is expired or does
// > not exist.  If a value _was_ found, attempt to JSON.parse() it.
// > (See `set-cached` for more info on why we're deserializing JSON here.)
    var value = await sails.getDatastore('cache').leaseConnection(async (db)=>{

        sails.log("adadadad");
      var found = await (util.promisify(db.get).bind(db))(ccc);
      if (found === null) {
        return undefined;
      } else {
        return JSON.parse(found);
      }
});


};

