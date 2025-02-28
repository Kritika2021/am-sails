// const passport = require('passport'),
// LocalStratrgy = require('passport-local').Strategy,
// bcrypt = require('bcrypt-nodejs');

// //Serialize the User
// passport.serializeUser(function(user, cb){
//     cb(null, user.id);
// });

// //Deserialize the User
// passport.deserializeUser(function(id, cb){
//     User.findOne({id}).exec(function(err, user){
//         cb(err, user);
//     });
// })

// //Local
// // passport.use(new LocalStratrgy({
// //         usernameField: 'username',
// //         passportField: 'password'
// //     }, function(username, password, cb){

// //     User.findOne({username: username}).exec(function(err, user){
// //         if(err) return cb(err);
// //         if(!user) return cb(null, false, {message: 'Usernaaame not found'});

// //         bcrypt.compare(password, user.password, function(err, res){
// //             if(!res) return cb(null, false, {message: 'Invalid Password'});
// //             return cb(null, user, {message: 'Login Succesful'});
// //         })
// //     });
// // }));

// passport.use(new OAuth2Strategy({
//     authorizationURL: 'https://www.example.com/oauth2/authorize',
//     tokenURL: 'https://www.example.com/oauth2/token',
//     clientID: EXAMPLE_CLIENT_ID,
//     clientSecret: EXAMPLE_CLIENT_SECRET,
//     callbackURL: "http://localhost:3000/auth/example/callback"
//   },
//   function(accessToken, refreshToken, profile, cb) {
//     User.findOrCreate({ exampleId: profile.id }, function (err, user) {
//       return cb(err, user);
//     });
//   }
// ));