import 'dart:async';
import 'dart:io';

import '../../utils/others/encrypt_codec.dart';
import '../../utils/ui_data.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._();

  static AppDatabase? get instance => _singleton;

  final SembastCodec? _codec = getEncryptSembastCodec(password: Configs.dbPass);
  final DatabaseFactory dbFactory = databaseFactoryIo;

  Completer<Database>? _dbOpenCompleter;

  AppDatabase._();

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }

    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, '${Configs.dbName}.db');
    final database = await dbFactory.openDatabase(
      dbPath,
      codec: _codec,
      version: Configs.dbVersion,
      onVersionChanged: onVersionChanged,
    );
    _dbOpenCompleter!.complete(database);
  }

  void onVersionChanged(Database db, int oldVersion, int newVersion) async {

  }
}
