import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import '../../text_information/collections_text.dart';

class BaseService<T> {
  final CollectionReference collection;
  final logger = Logger('MyApp');
  BaseService(this.collection);

  Future<List<T>> getAll<U>(
      T Function(DocumentSnapshot<Map<String, dynamic>> snapshot)
          fromFirestore) async {
    List<T> list = [];
    QuerySnapshot querySnapshot = await collection.get();

    for (var document in querySnapshot.docs) {
      list.add(
          fromFirestore(document as DocumentSnapshot<Map<String, dynamic>>));
    }
    return list;
  }

  Future<T?> getById<U>(
      String id,
      T Function(DocumentSnapshot<Map<String, dynamic>> fromFirestore)
          fromFirestore) async {
    DocumentSnapshot documentSnapshot = await collection.doc(id).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        return fromFirestore(
            documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
      }
    }
    return null;
  }

  Future<void> post<U>(
    T document,
    Map<String, dynamic> Function(T) toFirestore,
  ) async {
    try {
      Map<String, dynamic> documentData = toFirestore(document);
      await collection.add(documentData);
      logger.info(ServicesText.postSuccesful);
    } catch (e) {
      logger.warning('${ServicesText.postError}$e');
    }
  }

  Future<void> put<U>(
    String id,
    T updatedItem,
    Map<String, dynamic> Function(T) toFirestore,
  ) async {
    try {
      Map<String, dynamic> updatedData = toFirestore(updatedItem);
      await collection.doc(id).update(updatedData);
      logger.info(ServicesText.putSuccesful);
    } catch (e) {
      logger.warning('${ServicesText.putError} $e');
    }
  }

  // Future<void> put(String id, T updatedItem) async {
  //   try {
  //     Map<String, dynamic> updatedData = updatedItem.toFirestore();
  //     await collection.doc(id).update(updatedData);
  //   } catch (e) {
  //     print('Error al hacer PUT: $e');
  //   }
  // }

  Future<void> delete(String id) async {
    try {
      await collection.doc(id).delete();
    } catch (e) {
      print('Error al hacer DELETE: $e');
    }
  }
}
