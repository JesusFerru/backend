import 'package:cloud_firestore/cloud_firestore.dart';

class Bank {
  final String bankName;
  final String bankCountry;
  final String bankLogo;

  Bank({
    required this.bankName,
    required this.bankCountry,
    required this.bankLogo,
  });

  factory Bank.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Bank(
      bankName: data?['bankName'] ?? '',
      bankCountry: data?['bankCountry'] ?? '',
      bankLogo: data?['bankLogo'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'bankName': bankName,
      'bankCountry': bankCountry,
      'bankLogo': bankLogo,
    };
  }
}
