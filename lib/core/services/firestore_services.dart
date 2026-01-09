import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/core/services/database_service.dart';

class FirestoreServices implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<String?> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
    String? subCollectionPath,
  }) async {
    if (subCollectionPath != null) {
      var snapshot = await firestore
          .collection(path)
          .doc(docId)
          .collection(subCollectionPath)
          .add(data);
      return snapshot.id;
    } else {
      if (docId != null) {
        await firestore.collection(path).doc(docId).set(data);
        return null;
      } else {
        var snapshot = await firestore.collection(path).add(data);
        return snapshot.id;
      }
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    required String docId,
    String? subCollectionPath,
  }) async {
    if (subCollectionPath != null) {
      var snapshot = await firestore
          .collection(path)
          .doc(docId)
          .collection(subCollectionPath)
          .get();
      return snapshot.docs.map((e) {
        var data = e.data();
        data['docId'] = e.id;
        return data;
      }).toList();
    } else {
      var data = await firestore.collection(path).doc(docId).get();
      return data.data();
    }
  }

  @override
  Future<void> deleteData({
    required String path,
    required String docId,
    String? subCollectionPath,
    String? subDocId,
  }) async {
    if (subDocId != null && subCollectionPath != null) {
      await firestore
          .collection(path)
          .doc(docId)
          .collection(subCollectionPath)
          .doc(subDocId)
          .delete();
    } else {
      await firestore.collection(path).doc(docId).delete();
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String docId,
  }) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
