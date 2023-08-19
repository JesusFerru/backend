import 'package:bd_prueba_firebase/backend/models/person_network.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import '../../text_information/collections_text.dart';
import '../models/channel_cat.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
String personNetwork = CollectionsText.networkCollection;
final logger = Logger('MyApp');
CollectionReference collection =
    db.collection(CollectionsText.networkCollection);

Future<List> getPersonNetwork() async {
  List personNetworkList = [];
  QuerySnapshot queryTeam = await collection.get();

  for (var document in queryTeam.docs) {
    personNetworkList.add(document.data());
  }
  return personNetworkList;
}

Future<ChannelCategory?> getPersonNetworkById(String id) async {
  DocumentSnapshot documentSnapshot = await collection.doc(id).get();

  if (documentSnapshot.exists) {
    Map<String, dynamic>? data =
        documentSnapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      return ChannelCategory.fromFirestore(
          documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
    }
  }
  return null;
}

Future<void> postPersonNetwork(PersonNetwork person) async {
  try {
    Map<String, dynamic> personData = person.toFirestore();

    await collection.add(personData);
    logger.info(ServicesText.postSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.postError}$e');
  }
}

Future<void> putPersonNetwork(
    String id, PersonNetwork updatedPersonNetwork) async {
  try {
    Map<String, dynamic> updateData = updatedPersonNetwork.toFirestore();

    await collection.doc(id).update(updateData);
    logger.info(ServicesText.putSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.putError} $e');
  }
}

Future<void> deletePersonNetwork(String id) async {
  try {
    await collection.doc(id).delete();
    logger.info(ServicesText.removeSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.removeError} $e');
  }
}
