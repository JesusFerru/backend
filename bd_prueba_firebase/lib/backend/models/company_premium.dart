import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyPremium {
  final String companyId;
  final List<String> companyCatalog;
  final Map<String, String> openingHours;
  final bool hasDelivery;
  final List<Map<String, dynamic>> promotions;
  final List<String> companyContactsPhone;
  final String companyQr;
  final String instagramLink;
  final String whatsappLink;
  final String facebookLink;
  final int followersNumber;
  final int followedNumber;
  final dynamic transferAccount1;
  final dynamic transferAccount2;
  final dynamic transferAccount3;

  CompanyPremium({
    required this.companyId,
    required this.companyCatalog,
    required this.openingHours,
    required this.hasDelivery,
    required this.promotions,
    required this.companyContactsPhone,
    required this.companyQr,
    required this.instagramLink,
    required this.whatsappLink,
    required this.facebookLink,
    required this.followersNumber,
    required this.followedNumber,
    required this.transferAccount1,
    required this.transferAccount2,
    required this.transferAccount3,
  });

  factory CompanyPremium.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return CompanyPremium(
      companyId: data?['companyId'] ?? '',
      companyCatalog: List<String>.from(data?['companyCatalog'] ?? []),
      openingHours: Map<String, String>.from(data?['openingHours'] ?? {}),
      hasDelivery: data?['hasDelivery'] ?? false,
      promotions: List<Map<String, dynamic>>.from(data?['promotions'] ?? []),
      companyContactsPhone:
          List<String>.from(data?['companyContactsPhone'] ?? []),
      companyQr: data?['companyQr'] ?? '',
      instagramLink: data?['InstagramLink'] ?? '',
      whatsappLink: data?['WhatsAppLink'] ?? '',
      facebookLink: data?['FacebookLink'] ?? '',
      followersNumber: data?['FollowersNumber'] ?? 0,
      followedNumber: data?['FollowedNumber'] ?? 0,
      transferAccount1: data?['TransferAccount1'],
      transferAccount2: data?['TransferAccount2'],
      transferAccount3: data?['TransferAccount3'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'companyId': companyId,
      'companyCatalog': companyCatalog,
      'openingHours': openingHours,
      'hasDelivery': hasDelivery,
      'promotions': promotions,
      'companyContactsPhone': companyContactsPhone,
      'companyQr': companyQr,
      'InstagramLink': instagramLink,
      'WhatsAppLink': whatsappLink,
      'FacebookLink': facebookLink,
      'FollowersNumber': followersNumber,
      'FollowedNumber': followedNumber,
      'TransferAccount1': transferAccount1,
      'TransferAccount2': transferAccount2,
      'TransferAccount3': transferAccount3,
    };
  }
}
