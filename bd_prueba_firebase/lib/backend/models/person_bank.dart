import 'package:cloud_firestore/cloud_firestore.dart';

class PersonBank {
  final DocumentReference personId;
  final DocumentReference bankId;
  final String currency;
  final String bankAccount;

  PersonBank({
    required this.personId,
    required this.bankId,
    required this.currency,
    required this.bankAccount,
  });

  factory PersonBank.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return PersonBank(
      personId: data?['personId'] ?? '',
      bankId: data?['bankId'] ?? '',
      currency: data?['currency'] ?? '',
      bankAccount: data?['bankAccount'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'personId': personId,
      'bankId': bankId,
      'currency': currency,
      'bankAccount': bankAccount,
    };
  }
}
