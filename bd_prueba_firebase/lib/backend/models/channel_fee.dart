import 'package:cloud_firestore/cloud_firestore.dart';

class ChannelFee {
  final DocumentReference channelCategoryId;
  final DocumentReference channelCategoryName;
  final double premiumMN;
  final double premiumME;

  ChannelFee({
    required this.channelCategoryId,
    required this.channelCategoryName,
    required this.premiumMN,
    required this.premiumME,
  });

  factory ChannelFee.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return ChannelFee(
      channelCategoryId: data?['channelCategoryId'] ?? '',
      channelCategoryName: data?['channelCategoryName'] ?? '',
      premiumMN: (data?['premiumMN'] ?? 0).toDouble(),
      premiumME: (data?['premiumME'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'channelCategoryId': channelCategoryId,
      'channelCategoryName': channelCategoryName,
      'premiumMN': premiumMN,
      'premiumME': premiumME,
    };
  }
}
