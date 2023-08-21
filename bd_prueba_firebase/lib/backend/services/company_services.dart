import 'package:bd_prueba_firebase/backend/models/company.dart';
import 'package:bd_prueba_firebase/backend/models/person_network.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import '../../text_information/collections_text.dart';
import '../models/channel_cat.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
String company = CollectionsText.companyCollection;
final logger = Logger('MyApp');
CollectionReference collection =
    db.collection(CollectionsText.companyCollection);

Future<List> getCompany() async {
  List companyList = [];
  QuerySnapshot queryTeam = await collection.get();

  for (var document in queryTeam.docs) {
    companyList.add(document.data());
  }
  return companyList;
}

Future<ChannelCategory?> getCompanyById(String id) async {
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

Future<void> postCompany(Company company) async {
  try {
    Map<String, dynamic> companyData = company.toFirestore();

    await collection.add(companyData);
    logger.info(ServicesText.postSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.postError}$e');
  }
}

Future<void> putCompany(
    String id, Company updatedCompany) async {
  try {
    Map<String, dynamic> updateData = updatedCompany.toFirestore();

    await collection.doc(id).update(updateData);
    logger.info(ServicesText.putSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.putError} $e');
  }
}

Future<void> deleteCompany(String id) async {
  try {
    await collection.doc(id).delete();
    logger.info(ServicesText.removeSuccesful);
  } catch (e) {
    logger.warning('${ServicesText.removeError} $e');
  }
}
