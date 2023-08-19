import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import '../../text_information/collections_text.dart';
import '../models/channel_cat.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
String channelCat = CollectionsText.ChannelCatCollection;
CollectionReference collection = db.collection(channelCat);
final logger = Logger('MyApp');

Future<List> getChannelCategory() async {
  List channelList = [];
  QuerySnapshot queryTeam = await collection.get();

  for (var document in queryTeam.docs) {
    channelList.add(document.data());
  }
  return channelList;
}

Future<ChannelCategory?> getChannelCategoryById(String id) async {
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

Future<void> postChannelCategory(ChannelCategory person) async {
  try {
    Map<String, dynamic> personData = person.toFirestore();

    await collection.add(personData);
    logger.info(ServicesText.postSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.postError}$e');
  }
}

Future<void> putChannelCategory(
    String id, ChannelCategory updatedPerson) async {
  try {
    Map<String, dynamic> updatedData = updatedPerson.toFirestore();

    await collection.doc(id).update(updatedData);
    logger.info(ServicesText.putSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.putError} $e');
  }
}

Future<void> deleteChannelCategory(String id) async {
  try {
    await collection.doc(id).delete();
    logger.info(ServicesText.removeSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.removeError} $e');
  }
}
