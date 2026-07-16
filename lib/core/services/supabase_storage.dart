import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/error/exceptions.dart';
import 'package:curely/core/services/storage_services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SupabaseStorage implements StorageServices {
  final _client = Supabase.instance.client;

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    String fileName = p.basename(file.path);

    await _client.storage
        .from(DatabaseConstants.imagesBucket)
        .upload(
          '$path/${DateTime.now().millisecondsSinceEpoch}$fileName',
          file,
        );

    final String publicUrl = _client.storage
        .from(DatabaseConstants.imagesBucket)
        .getPublicUrl('$path/$fileName');

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

  @override
  Future<Uint8List> downloadFile({required String url}) async {
    // Extract bucket name and file path from the Supabase Public URL
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;

    // Public URL format usually: .../storage/v1/object/public/[bucket]/[path]
    final publicIndex = segments.indexOf('public');
    if (publicIndex == -1 || publicIndex + 2 > segments.length) {
      log("Invalid Supabase storage URL");
      throw CustomException(message: "download_image_error".tr());
    }

    final bucketName = segments[publicIndex + 1];
    final internalPath = segments.sublist(publicIndex + 2).join('/');

    final fileBytes = await _client.storage
        .from(bucketName)
        .download(internalPath);

    return fileBytes;
  }
}
