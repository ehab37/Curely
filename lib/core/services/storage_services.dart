import 'dart:io';

abstract class StorageServices {
  Future<String> uploadFile({required File file, required String path});

  Future<List<String>> uploadFiles({
    required List<File> files,
    required String path,
  });
}
