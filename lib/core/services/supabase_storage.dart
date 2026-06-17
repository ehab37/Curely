import 'dart:io';
import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/services/storage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SupabaseStorage implements StorageServices {
  final _client = Supabase.instance.client;

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);

    await _client.storage
        .from(DatabaseConstants.imagesBucket)
        .upload('$path/$fileName.$extensionName', file);

    final String publicUrl = _client.storage
        .from(DatabaseConstants.imagesBucket)
        .getPublicUrl('$path/$fileName.$extensionName');

    return publicUrl;
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
