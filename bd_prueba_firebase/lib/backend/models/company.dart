import 'package:cloud_firestore/cloud_firestore.dart';

class Company {
  final DocumentReference personId;
  final DocumentReference channelCategoryId;
  final DocumentReference businessCategoryId;
  final String companyUserName;
  final String companyAddress;
  final GeoPoint companyGeolocalization;
  final String companyProfilePhoto;
  final int companyPhone;
  final DateTime registerDate;
  final String companyMembership;
  final double rating;

  Company({
    required this.personId,
    required this.channelCategoryId,
    required this.businessCategoryId,
    required this.companyUserName,
    required this.companyAddress,
    required this.companyGeolocalization,
    required this.companyProfilePhoto,
    required this.companyPhone,
    required this.registerDate,
    required this.companyMembership,
    required this.rating,
  });

  factory Company.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Company(
      personId: data?['personId'] ?? FirebaseFirestore.instance.doc(''), 
      businessCategoryId: data?['businessCategoryId'] ?? FirebaseFirestore.instance.doc(''), 
      channelCategoryId: data?['channelCategoryId'] ?? FirebaseFirestore.instance.doc(''), 
      companyUserName: data?['companyUserName'] ?? '',
      companyAddress: data?['companyAddress'] ?? '',
      companyGeolocalization: GeoPoint(data?['companyGeolocalization']['latitude'], data?['companyGeolocalization']['longitude']), 
      companyProfilePhoto: data?['companyProfilePhoto'] ?? '',
      companyPhone: data?['companyPhone'] ?? '',
      registerDate: (data?['registerDate'] as Timestamp).toDate(),
      companyMembership: data?['companyMembership'] ?? '',
      rating: (data?['rating'] ?? 0).toDouble(),
    );
  }

  // Convierte una instancia de Person en un mapa para guardar en Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'personId': personId,
      'businessCategoryId': businessCategoryId,
      'channelCategoryId': channelCategoryId,
      'companyUserName': companyUserName,
      'companyAddress': companyAddress,
      'companyGeolocalization': {
        'latitude': companyGeolocalization.latitude,
        'longitude': companyGeolocalization.longitude
      },
      'companyProfilePhoto': companyProfilePhoto,
      'companyPhone': companyPhone,
      'registerDate': Timestamp.fromDate(registerDate),
      'companyMembership': companyMembership,
      'rating': rating
    };
  }
}