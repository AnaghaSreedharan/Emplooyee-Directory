/*
import 'dart:developer';
import 'dart:io' as io;

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'package:sqflite/sqflite.dart';

import '../Models/EmployeeModel.dart';
class DBHelperSample {
  static Database? _db;
  static final table = 'search';
  static final columnId = 'id';
  static final columnPid = 'pid';
  static final columnName = 'name';
  static final columnType = 'type';
  static final columnVehicle = 'vehicle';

  String exist = "0";
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'search.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE $table ($columnId INTEGER PRIMARY KEY, $columnPid TEXT, $columnName TEXT, $columnType TEXT, $columnVehicle TEXT)');
  }

  Future<EmployeeModel> add(EmployeeModel employee) async {
    var dbClient = await db;
    List<Map> maps = await dbClient!.query(table, columns: [columnId,columnPid,columnName,columnType,columnVehicle]);
    log(maps.length.toString());
   if(maps.length>=8){
      deleteByPos(1);
      update(employee);
    }else {
      // String query = "";
      // query = "SELECT COUNT(*) FROM $table WHERE  $columnPid LIKE '"+ employee.pid +"' ";
      // if(query=="") {

         employee.id = await dbClient.insert(table, employee.toMap());

     }
    print(await _db.query(DBHelperSample.table));
    return employee;
  }

  Future<List<RecentSearchModel>> getVehicleRecentSearches() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(table, columns: [columnId,columnPid,columnName,columnType,columnVehicle] );
    List<RecentSearchModel> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        // if(columnType[i]=="vehicle") {
          employees.add(RecentSearchModel.fromMap(maps[i]));
        // }
      }
    }
    print(await _db.query(DBHelperSample.table));
    return employees;
  }

  // Future<List<RecentSearchModel>> getAccessoryRecentSearches() async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query(table, columns: [columnId,columnPid,columnName,columnType,columnVehicle]);
  //   List<RecentSearchModel> employees = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       // if(columnType=="accessory") {
  //         employees.add(RecentSearchModel.fromMap(maps[i]));
  //       // }
  //     }
  //   }
  //   print(await _db.query(DBHelperSample.table));
  //   return employees;
  // }

  Future<int> deleteByPos(int id) async {
    var dbClient = await db;

    return await dbClient.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [1],
    );
  }

  Future<int> deleteById(String pid,String type) async {
    var dbClient = await db;
     // log('$columnPid');
     //  if('$columnVehicle = ?'==type) {
        return await dbClient.delete(
            table, where: '$columnPid = ?', whereArgs: [pid]);
      // }

  }

  Future<int> update(RecentSearchModel employee) async {
    log("delbypo");
    var dbClient = await db;
    return await dbClient.update(
      table,
      employee.toMap(),
      where: '$columnId = ?',
      whereArgs: [1],
      // whereArgs: [employee.pid],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
*/
