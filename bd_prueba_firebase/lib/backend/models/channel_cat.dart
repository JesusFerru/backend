import 'package:cloud_firestore/cloud_firestore.dart';

class ChannelCategory {
  final String channelCategoryName;

  ChannelCategory({
    required this.channelCategoryName,
  });

  factory ChannelCategory.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return ChannelCategory(
      channelCategoryName: data['channelCategoryName'] ?? '',
    );
  }

  // Convierte una instancia de ChannelCategory en un mapa Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'channelCategoryName': channelCategoryName,
    };
  }
}
