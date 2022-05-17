import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:application/src/models/empresa.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async => _database ??= await initDB();

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'db_anuario');

    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE empresa ('
          ' id INTEGER PRIMERY KEY,'
          ' nombre TEXT,'
          ' latitude REAL,'
          ' longitud REAl'
          ')');
    });
  }

  Future<void> insertEmpresa(Empresa emp) async {
    final db = await database;

    await db.insert(
      'empresa',
      emp.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Empresa>> empresas() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Empresas.
    final List<Map<String, dynamic>> maps = await db.query('empresa');

    // Convert the List<Map<String, dynamic> into a List<Empresa>.
    return List.generate(maps.length, (i) {
      return Empresa(
        id: maps[i]['id'],
        name: maps[i]['name'],
        latitude: maps[i]['latitude'],
        longitud: maps[i]['longitud'],
        print("dsdsdsdsdsdsd")
      );
    });
  }
}
