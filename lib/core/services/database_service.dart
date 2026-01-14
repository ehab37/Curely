abstract class DatabaseService {
  Future<String?> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
    String? subCollectionPath,
  });

  Future<void> updateData({
    required String path,
    required String docId,
    required Map<String, dynamic> data,
  });

  Future<dynamic> getData({
    required String path,
    required String docId,
    String? subCollectionPath,
    Map<String,dynamic>? query,
  });

  Future<void> deleteData({
    required String path,
    required String docId,
    String? subCollectionPath,
    String? subDocId,
  });

  Future<bool> checkIfDataExists({required String path, required String docId});
}
