import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  final String personName;
  final String paternalLastName;
  final String maternalLastName;
  final int phoneNumber;
  final String email;
  final String userName;
  final String personSex;
  final DateTime birthDate;
  final List<String>? hobbies;
  final String? civilStatus;
  final DateTime registerDate;
  final String profilePhoto;
  final String? facebookAccount;
  final String? instagramAccount;
  final String? twitterAccount;
  final String? linkedinAccount;

  Person({
    required this.personName,
    required this.paternalLastName,
    required this.maternalLastName,
    required this.phoneNumber,
    required this.email,
    required this.userName,
    required this.personSex,
    required this.birthDate,
    this.hobbies,
    this.civilStatus,
    required this.registerDate,
    required this.profilePhoto,
    this.facebookAccount,
    this.instagramAccount,
    this.twitterAccount,
    this.linkedinAccount,
  });

  // Crea una instancia de Person a partir de un documento Firestore
  factory Person.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Person(
      personName: data?['personName'] ?? '',
      paternalLastName: data?['paternalLastName'] ?? '',
      maternalLastName: data?['maternalLastName'] ?? '',
      phoneNumber: data?['phoneNumber'] ?? 0,
      email: data?['email'] ?? '',
      userName: data?['userName'] ?? '',
      personSex: data?['personSex'] ?? '',
      birthDate: (data?['birthDate'] as Timestamp).toDate(),
      hobbies: List<String>.from(data?['hobbies'] ?? []),
      civilStatus: data?['civilStatus'] ?? '',
      registerDate: (data?['registerDate'] as Timestamp).toDate(),
      profilePhoto: data?['profilePhoto'] ?? '',
      facebookAccount: data?['facebook'] ?? '',
      instagramAccount: data?['instagram'] ?? '',
      twitterAccount: data?['twitter'] ?? '',
      linkedinAccount: data?['linkedin'] ?? '',
    );
  }

  // Convierte una instancia de Person en un mapa para guardar en Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'personName': personName.trim(),
      'paternalLastName': paternalLastName,
      'maternalLastName': maternalLastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'userName': userName,
      'personSex': personSex,
      'birthDate': Timestamp.fromDate(birthDate),
      'hobbies': hobbies,
      'civilStatus': civilStatus,
      'registerDate': Timestamp.fromDate(registerDate),
      'profilePhoto': profilePhoto,
      'facebook': facebookAccount,
      'instagram': instagramAccount,
      'twitter': twitterAccount,
      'linkedin': linkedinAccount,
    };
  }
}
