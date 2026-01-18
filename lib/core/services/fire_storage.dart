import 'dart:io';
import 'package:curely/core/services/storage_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class FireStorage implements StorageServices {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);
    var fileRef = storageRef.child('$path/$fileName.$extensionName');
    var result = await fileRef.putFile(file);
    String url = await result.ref.getDownloadURL();
    return url;
  }

  @override
  Future<List<String>> uploadFiles({
    required List<File> files,
    required String path,
  }) async {
    List<String> urls = [];
    for (var file in files) {
      String url = await uploadFile(file: file, path: path);
      urls.add(url);
    }
    return urls;
  }
}
