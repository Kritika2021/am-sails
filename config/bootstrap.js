/**
 * Seed Function
 * (sails.config.bootstrap)
 *
 * A function that runs just before your Sails app gets lifted.
 * > Need more flexibility?  You can also create a hook.
 *
 * For more information on seeding your app with fake data, check out:
 * https://sailsjs.com/config/bootstrap
 */

module.exports.bootstrap = async function() {

  // By convention, this is a good place to set up fake data during development.
  //
  // For example:
  // ```
  // // Set up fake development data (or if we already have some, avast)
  // if (await User.count() > 0) {
  //   return;
  // }
  //
  // await User.createEach([
  //   { emailAddress: 'ry@example.com', fullName: 'Ryan Dahl', },
  //   { emailAddress: 'rachael@example.com', fullName: 'Rachael Shaw', },
  //   // etc.
  // ]);
  // ```



  // User.findOne({email: 'welcomekritika@gmail.com' , mobile_number : '9871204026'}, function(err, user){
  //   if(!user){
  //     User.create({
  //   email: 'welcomekritika@gmail.com',
  //   password: 'password',
  //   mobile_number: '9871204026'
  //     }).exec(function(err,user){
  //   console.log("Default user created");
  //       console.log("- username: " + user.email);
  //       console.log("- password: password");
  //     });
  //   } else {
  //     console.log('Default user already exists');
  //     console.log("- username: " + user.email);
  //     console.log("- password: password");
  //   }
  // });

};
