import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';

class SQLiteHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initWinDB();
    return _database!;
  }

  Future<Database> initWinDB() async {
    sqfliteFfiInit();
    final databaseFactory = databaseFactoryFfi;
    var databasesPath = await getLibraryDirectory();
    var path = join(databasesPath, "GreatMoviesSQLite.db3");
    var exists = await databaseExists(path);
    if (!exists) {
      print("creating new copy from asset");

      // Make sure parent dir exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data =
          await rootBundle.load(url.join("assets", "GreatMoviesSQLite.db3"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("opening existing db");
    }

    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(readOnly: false),
    );
  }

  Future<String> getLibraryDirectory() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
