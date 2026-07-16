import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloader {
  Future<void> downloadFile({required Uint8List fileBytes}) async {
    // 1. Get temporary directory to download the file into
    final directory = await getTemporaryDirectory();
    // Create an image name
    var now = DateTime.now();
    final savePath =
        '${directory.path}/image_${now.year}-${now.month}-${now.day}-${now.hour}-${now.minute}-${now.second}_com.curely.png';

    // 2. Save to the provided local path
    final File file = File(savePath);
    await file.writeAsBytes(fileBytes);

    // 3. Use flutter_file_dialog to save it to the Gallery/Downloads
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    await FlutterFileDialog.saveFile(params: params);

    // 4. Clean up the temporary file
    await file.delete();
  }
}
