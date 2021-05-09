import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qrapp/src/models/scan_model.dart';

import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  //get database instance
  Future<Database> get _db async {
    if (_database != null)
      return _database;
    else
      _database = await _initDB();
    return _database;
  }

  //initialized database, if there's an existing instance, this wil be returned
  Future<Database> _initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'ScansDB.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE scans ('
          'id INTEGER PRIMARY KEY,'
          'type TEXT,'
          'value TEXT'
          ');');
    });
  }

  //insert a regiser with rawSQL
  Future<int> insertScanRaw(ScanModel scan) async {
    final db = await _db;
    final res = await db.rawInsert("INSERT INTO scans (id,type,value) "
        "VALUES (${scan.id},${scan.type},${scan.value})");
    return res;
  }

  //insert a regiser with rawSQL
  Future<int> insertScan(ScanModel scan) async {
    final db = await _db;
    final res = await db.insert('scans', scan.toJson());
    return res;
  }

  //get scan by id
  Future<ScanModel> getScanById(int id) async {
    final db = await _db;
    final res = await db.query('scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  //get all scans
  Future<List<ScanModel>> getScans() async {
    final db = await _db;
    final res = await db.query('scans');
    List<ScanModel> list = res.isNotEmpty
        ? res.map((row) => ScanModel.fromJson(row)).toList()
        : [];
    return list;
  }

  //get scans by type
  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await _db;
    final res =
        await db.query('scans', where: "type LIKE '%?%'", whereArgs: [type]);
    List<ScanModel> list = res.isNotEmpty
        ? res.map((row) => ScanModel.fromJson(row)).toList()
        : [];
    return list;
  }

  //update scan
  Future<int> updateScan(ScanModel scan) async {
    final db = await _db;
    final res = await db
        .update('scans', scan.toJson(), where: 'id = ?', whereArgs: [scan.id]);
    return res;
  }

  //delete scan
  Future<int> deleteScan(int id) async {
    final db = await _db;
    final res = await db.delete('scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  //truncate scans
  Future<int> deleteAll() async {
    final db = await _db;
    final res = await db.rawDelete('DELETE FROM scans');
    return res;
  }
}
