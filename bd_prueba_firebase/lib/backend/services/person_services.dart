import 'package:bd_prueba_firebase/text_information/collections_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';

import '../models/person.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
String people = CollectionsText.peopleCollection;
final logger = Logger('MyApp');
CollectionReference ref_People = db.collection(people);

Future<List> getPerson() async {
  List peopleList = [];
  QuerySnapshot queryTeam = await ref_People.get();

  for (var document in queryTeam.docs) {
    peopleList.add(document.data());
  }
  return peopleList;
}

Future<Person?> getPersonById(String personId) async {
  DocumentSnapshot documentSnapshot = await ref_People.doc(personId).get();

  if (documentSnapshot.exists) {
    Map<String, dynamic>? data =
        documentSnapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      return Person.fromFirestore(
          documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
    }
  }
  return null;
}

Future<void> postPerson(Person person) async {
  try {
    Map<String, dynamic> personData = person.toFirestore();

    await ref_People.add(personData);
    logger.info('Persona agregada correctamente a Firestore.');
  } catch (e) {
    logger.warning('Error al agregar persona a Firestore: $e');
  }
}

Future<void> putPerson(String personId, Person updatedPerson) async {
  try {
    Map<String, dynamic> updatedData = updatedPerson.toFirestore();

    await ref_People.doc(personId).update(updatedData);
    logger.info('Persona actualizada correctamente en Firestore.');
  } catch (e) {
    logger.warning('Error al actualizar persona en Firestore: $e');
  }
}

Future<void> deletePerson(String personId) async {
  try {
    await ref_People.doc(personId).delete();
    logger.info('Persona eliminada correctamente de Firestore.');
  } catch (e) {
    logger.warning('Error al eliminar persona de Firestore: $e');
  }
}
