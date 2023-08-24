import 'package:bd_prueba_firebase/backend/services/auth_services.dart';
import 'package:bd_prueba_firebase/text_information/collections_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import '../models/person.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
String people = CollectionsText.peopleCollection;
final logger = Logger('MyApp');
CollectionReference collection = db.collection(people);

Future<List> getPerson() async {
  List peopleList = [];
  QuerySnapshot queryTeam = await collection.get();

  for (var document in queryTeam.docs) {
    peopleList.add(document.data());
  }
  return peopleList;
}

Future<Person?> getByPhoneNumber(int phoneNumber) async {
  final QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
      .collection(people)
      .where('phoneNumber', isEqualTo: phoneNumber)
      .limit(1)
      .get();
  print("Query snapshot data: ${querySnapshot.docs}");
  return Person.fromFirestore(querySnapshot.docs.first);
  // if (querySnapshot.docs.isNotEmpty) {
  //   return Person.fromFirestore(querySnapshot.docs.first);

  // } else {
  //   return null;
  // }
}

Future<Person?> getPersonById(String personId) async {
  DocumentSnapshot documentSnapshot = await collection.doc(personId).get();

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

    await collection.add(personData);
    logger.info(ServicesText.postSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.postError}$e');
  }
}

Future<void> personRegister(Person person, AuthService authService) async {
  try {
    Map<String, dynamic> personData = person.toFirestore();
    await collection.doc(authService.getCurrentUser()?.uid).set(personData);
    logger.info(ServicesText.postSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.postError}$e');
  }
}

Future<void> putPerson(String personId, Person updatedPerson) async {
  try {
    Map<String, dynamic> updatedData = updatedPerson.toFirestore();

    await collection.doc(personId).update(updatedData);
    logger.info(ServicesText.putSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.putError} $e');
  }
}

Future<void> deletePerson(String personId) async {
  try {
    await collection.doc(personId).delete();
    logger.info(ServicesText.removeSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.removeError} $e');
  }
}
