import '../backend/models/person.dart';

Person personExample() {
  return Person(
    personName: 'Bismark',
    paternalLastName: 'Aramayo',
    maternalLastName: 'Lijeron',
    phoneNumber: 70809010,
    email: 'bismark@example.com',
    userName: 'abbys',
    personSex: 'Male',
    birthDate: DateTime(2002, 03, 23),
    hobbies: [
      'Videogames',
      'Natación',
      'Volleyball',
      'Gym',
      'Streaming',
    ],
    civilStatus: 'Single',
    registerDate: DateTime.now(),
    profilePhoto: 'profile-photo-url',
    facebookAccount: 'abbys_facebook.com',
    instagramAccount: '@instaAbbys',
    twitterAccount: 'abbysTweet',
    linkedinAccount: 'abbys_Linkedin',
  );
}
