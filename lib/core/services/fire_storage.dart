import 'dart:io';
import 'dart:typed_data';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/services/storage_services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class FireStorage implements StorageServices {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    String fileName = p.basename(file.path);
    var fileRef = storageRef.child('$path/$fileName');
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

  @override
  Future<Uint8List> downloadFile({required String url}) async {
    final ref = FirebaseStorage.instance.refFromURL(url);
    final Uint8List? fileBytes = await ref.getData(10 * 1024 * 1024);
    if (fileBytes == null) {
      throw CustomException(message: "download_image_error".tr());
    }
    return fileBytes;
  }

  @override
  Future<void> deleteFile({required String url}) async {
    final ref = FirebaseStorage.instance.refFromURL(url);
    await ref.delete();
  }

  @override
  Future<void> deleteFiles({required List<String> urls}) async {
    for (var url in urls) {
      await deleteFile(url: url);
    }
  }
}
