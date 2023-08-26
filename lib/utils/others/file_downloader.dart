import 'dart:io';

import '../utils.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_string/random_string.dart';

enum FileDownloaderArg { TaskId, Path }

class FileDownloader {
  static Future<bool> _checkPermission() async {
    var permission = await Permission.storage.request();
    if (permission != PermissionStatus.granted) {
      permission = await Permission.storage.request();
      if (permission == PermissionStatus.granted) {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  static Future<String> _findLocalPath() async {
    final directory = await getExternalStorageDirectory();
    return directory!.path;
  }

  static Future<Map<FileDownloaderArg, String>?> download(String url) async {
    if (!await _checkPermission()) {
      //permission not granted
      return null;
    }

    var rawExtension = p.extension(url);
    var fExtension = rawExtension == ".jpg" ||
            rawExtension == ".jpeg" ||
            rawExtension == ".png" ||
            rawExtension == ".gif"
        ? rawExtension
        : ".jpg";
    var _localPath = (await _findLocalPath()) + '/Download';
    var _fName = "IMG_" +
        randomAlphaNumeric(5).toUpperCase() +
        DateTime.now().millisecondsSinceEpoch.toString() +
        fExtension;

    final savedDir = Directory(_localPath);
    var hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: _localPath,
      showNotification: true,
      // show download progress in status bar (for Android)
      openFileFromNotification: true,
      // click on notification to open downloaded file (for Android)
      fileName: _fName,
    );

    await FlutterDownloader.registerCallback((id, status, progress) async {
      // code to update your UI
      if (id == taskId) {
        if (status == DownloadTaskStatus.complete) {
          await Utils.updateImageGallery("$_localPath/$_fName");
        }
      }
    });

    return {
      FileDownloaderArg.TaskId: taskId!,
      FileDownloaderArg.Path: _localPath,
    };
  }
}
