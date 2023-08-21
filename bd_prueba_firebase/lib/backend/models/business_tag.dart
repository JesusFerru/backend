import 'package:cloud_firestore/cloud_firestore.dart';

class BusinessTags {
  final DocumentReference businessCategoryId;
  final String businessTagsName;

  BusinessTags({
    required this.businessCategoryId,
    required this.businessTagsName,
  });

  factory BusinessTags.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return BusinessTags(
      businessCategoryId: data?['businessCategoryId'] ?? '',
      businessTagsName: data?['businessTagsName'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'businessCategoryId': businessCategoryId,
      'businessTagsName': businessTagsName,
    };
  }
}
