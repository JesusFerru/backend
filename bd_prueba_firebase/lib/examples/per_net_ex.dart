import 'package:bd_prueba_firebase/backend/models/person_network.dart';
import 'package:bd_prueba_firebase/text_information/collections_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

PersonNetwork personNetworkExample() {
  return PersonNetwork(
      personId: FirebaseFirestore.instance
          .collection(CollectionsText.peopleCollection)
          .doc('8uY6Q4HXkTqSqVQ2F76j'),
      sponsorId: FirebaseFirestore.instance
          .collection(CollectionsText.peopleCollection)
          .doc('PEk7a0Ytea8G5wgCJBzq'),
      level: 1,
      positionLevel: 1,
      state: NetworkState.active);
}
