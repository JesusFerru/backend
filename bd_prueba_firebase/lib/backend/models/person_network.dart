import 'package:cloud_firestore/cloud_firestore.dart';

enum NetworkState {
  active,
  inactive,
}

class PersonNetwork {
  final DocumentReference personId;
  final DocumentReference sponsorId;
  final int level;
  final int positionLevel;
  final NetworkState state;

  PersonNetwork({
    required this.personId,
    required this.sponsorId,
    required this.level,
    required this.positionLevel,
    required this.state,
  });

  factory PersonNetwork.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    final stateString = data?['state'] as String;

    return PersonNetwork(
      personId: data?['personId'] ?? FirebaseFirestore.instance.doc(''),
      sponsorId: data?['sponsorId'] ?? FirebaseFirestore.instance.doc(''),
      level: data?['level'] ?? 0,
      positionLevel: data?['positionLevel'] ?? 0,
      state: NetworkState.values.firstWhere(
        (state) => state.toString() == 'NetworkState.$stateString',
      ),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'personId': personId, // referencia
      'sponsorId': sponsorId, // Aquí asignamos la referencia directamente
      'level': level,
      'positionLevel': positionLevel,
      'state': state.toString().split('.').last,
    };
  }
}
