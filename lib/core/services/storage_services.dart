import 'dart:io';
import 'dart:typed_data';

abstract class StorageServices {
  Future<String> uploadFile({required File file, required String path});

  Future<List<String>> uploadFiles({
    required List<File> files,
    required String path,
  });

  Future<Uint8List> downloadFile({required String url});
}
