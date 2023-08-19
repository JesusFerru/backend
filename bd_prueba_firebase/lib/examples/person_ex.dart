import '../backend/models/person.dart';

Person personExample() {
  return Person(
    personName: 'Luis',
    paternalLastName: 'Ferrufino',
    maternalLastName: 'Burgos',
    phoneNumber: 65942169,
    email: 'ljesus@example.com',
    userName: 'luisyisus',
    personSex: 'Male',
    birthDate: DateTime(2002, 11, 21),
    hobbies: [
      'Videogames',
      'Natación',
      'Futbol',
      'Volleyball',
      'Leer',
    ],
    civilStatus: 'Divorcied',
    registerDate: DateTime.now(),
    profilePhoto: 'profile-photo-url',
    facebookAccount: 'jesus_facebook.com',
    instagramAccount: '@instaJesus',
    twitterAccount: 'luisTweet',
    linkedinAccount: 'luis_Linkedin',
  );
}
