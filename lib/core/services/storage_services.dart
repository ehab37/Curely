import 'dart:io';

abstract class StorageServices{
  Future<String> uploadFile({required File file,required String path});
}