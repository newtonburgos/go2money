// lib/data/dao/currency_dao.dart
import 'package:sqflite/sqflite.dart';
import '../db/app_database.dart';
import '../models/currency.dart';

class CurrencyDao {
  Future<Database> get _db async => AppDatabase.instance;

  /* CRUD -------------------------------------------------------------- */
  Future<void> insert(Currency c) async {
    final db = await _db;
    await db.insert(
      'currency',
      c.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Currency>> getAll() async {
    final db = await _db;
    final rows = await db.query(
      'currency',
      where: 'status = 1',
      orderBy: 'is_primary DESC',
    );
    return rows.map(Currency.fromMap).toList();
  }

  Future<Currency?> findByCode(String code) async {
    final db = await _db;
    final rows = await db.query(
      'currency',
      where: 'code = ?',
      whereArgs: [code],
    );
    return rows.isNotEmpty ? Currency.fromMap(rows.first) : null;
  }

  Future<List<Currency>> findByName(String text) async {
    final db = await _db;
    final rows = await db.query(
      'currency',
      where: 'name LIKE ? AND status = 1',
      whereArgs: ['%$text%'],
    );
    return rows.map(Currency.fromMap).toList();
  }

  Future<void> delete(String code) async {
    final db = await _db;
    await db.delete('currency', where: 'code = ?', whereArgs: [code]);
  }

  /* Cambios de estado -------------------------------------------------- */
  Future<void> setPrimary(String code) async {
    final db = await _db;
    await db.transaction((txn) async {
      await txn.update('currency', {'is_primary': 0});
      await txn.update(
        'currency',
        {'is_primary': 1, 'rate_to_primary': 1},
        where: 'code = ?',
        whereArgs: [code],
      );
    });
  }

  Future<void> setInactive(String code) async {
    final db = await _db;
    await db.update(
      'currency',
      {'status': 0, 'is_primary': 0},
      where: 'code = ?',
      whereArgs: [code],
    );
  }
}
