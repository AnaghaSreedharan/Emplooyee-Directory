import 'dart:io';
import 'package:employee_app/Utils/Utils.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Models/EmployeeDbModel.dart';


class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'employee_manager.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Employee('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'username TEXT,'
          'email TEXT,'
          'phone TEXT,'
          'profile_image TEXT,'
          'address TEXT,'
          'latitude TEXT,'
          'longitude TEXT,'
          'company_name TEXT,'
          'catchPhrase TEXT,'
          'bs TEXT,'
          'website TEXT'
          ')');
    });
  }

  // Insert employee on database
  createEmployee(EmployeeDbModel? newEmployee) async {
    await deleteAllEmployees();
    final db = await database;
    final res = await db!.insert('Employee', newEmployee!.toJson());
    return res;
  }

  // Delete all employees
  Future<int> deleteAllEmployees() async {
    final db = await database;
    final res = await db!.rawDelete('DELETE FROM Employee');

    return res;
  }

  Future<List<EmployeeDbModel>> getAllEmployees() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM EMPLOYEE");

    List<EmployeeDbModel> list =
        res.isNotEmpty ? res.map((c) => EmployeeDbModel.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<EmployeeDbModel>> getSearchResult() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM EMPLOYEE");

    List<EmployeeDbModel> list =
    res.isNotEmpty ? res.map((c) => EmployeeDbModel.fromJson(c)).toList() : [];

    return list;
  }
}
