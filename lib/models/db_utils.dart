import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'iletisimData.dart';

class DbUtils {
  static final DbUtils _dbUtils = DbUtils._internal();
  DbUtils._internal();

  factory DbUtils() {
    return _dbUtils;
  }

  static Database _db;
  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'kpssuygulamasi.db');
    var dbkpssuygulamasi =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return dbkpssuygulamasi;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE kpssiletisim(id INTEGER PRIMARY KEY, adi TEXT, eposta TEXT, telefon TEXT, mesaj TEXT)");
    //"CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
  }

  Future<void> deleteTable() async {
    final Database db = await this.db;
    db.delete('dogs');
  }

  Future<void> insertiletisim(kpssiletisim kpssiletisim) async {
    final Database db = await this.db;
    await db.insert(
      'kpssiletisim',
      kpssiletisim.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<kpssiletisim>> kpssiletisimMesaj() async {
    final Database db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query('kpssiletisim');
    return List.generate(maps.length, (i) {
      return kpssiletisim(
        adi: maps[i]['adi'],
        eposta: maps[i]['eposta'],
        telefon: maps[i]['telefon'],
        mesaj: maps[i]['mesaj'],
      );
    });
  }
}
