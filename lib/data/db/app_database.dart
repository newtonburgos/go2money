import 'package:go2money/data/db/tables.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static const _dbName = 'go2money.db';
  static const _dbVersion = 1;
  static Database? _instance;

  AppDatabase._();

  static Future<Database> get instance async {
    if (_instance != null) return _instance!;
    final docs = await getApplicationDocumentsDirectory();
    final path = join(docs.path, _dbName);

    _instance = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return _instance!;
  }

  static Future<void> _onCreate(Database db, int version) async {
    await createDatabaseV1(db);
  }

  static Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    await migrateDatabase(db, oldVersion, newVersion);
  }

  static Future<void> createDatabaseV1(Database db) async {
    for (final tableSql in createTablesV1) {
      await db.execute(tableSql);
    }
  }

  static Future<void> migrateDatabase(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    // Aquí se implementará la lógica de migración para cada versión
    // Ejemplo:
    // if (oldVersion < 2) {
    //   // Migrar de la versión 1 a la 2
    //   await db.execute("ALTER TABLE example_table ADD COLUMN new_column TEXT;");
    // }
    // if (oldVersion < 3) {
    //   // Migrar de la versión 2 a la 3
    //   // ...
    // }
  }
}
