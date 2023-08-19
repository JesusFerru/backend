import 'package:cloud_firestore/cloud_firestore.dart';

class BusinessCategory {
  final String businessCategoryName;

  BusinessCategory({
    required this.businessCategoryName,
  });

  factory BusinessCategory.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return BusinessCategory(
      businessCategoryName: data?['businessCategoryName'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'businessCategoryName': businessCategoryName,
    };
  }
}
