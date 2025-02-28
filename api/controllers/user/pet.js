module.exports = {


  friendlyName: 'Pet',


  description: 'Pet user.',


  inputs: {
    user_id : {
      type:'number'
    }
  },


  exits: {

  },


  fn: async function (inputs) {

   // let userdata = await Ur.create({
   //       firstName: 'Kritika',
   //       lastName:'KOhli'
   //      });
   // let data = await Pet.create({
   //        breed: 'labrador',
   //        type: 'dog',
   //        name: 'fido',

   //        // Set the User's Primary Key to associate the Pet with the User.
   //        owner: 4
   //      });

   // var pets = await Pet.find();
   // console.log(pets);

   // var users = await Ur.find();
   // console.log(users);

   var things = await Ur.find({ id : inputs.user_id }).populate('pets', {
    where:{
      breed : 'labrador'
    },
    sort : 'ASC'
   });
   



    return {
      
      things: things,
    };
    //.populate('borrowedBy');
   //var pop = await Ur.find().populate('pets');
   //console.log(pop.id);

  }


};
