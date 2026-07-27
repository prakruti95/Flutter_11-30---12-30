import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class MyDbHelper
{
  static final _databaseName = "topstech.db";
  static final _databaseVersion = 1;

  //table1
  static final table1 = 'category';
  static final columnId = '_id';
  static final columnname = 'category_name';

  //table 2
  static final table2 = 'contact';
  static final columnId1 = '_id';
  static final columnName = 'name';
  static final columnLName = 'lname';
  static final columnMobile = 'mobile';
  static final columnEmail = 'email';
  static final columnCategory = 'cat';
  static final columnProfile = 'profile';

  static Database? _database;

  MyDbHelper._privateConstructor();

  static final MyDbHelper instance = MyDbHelper._privateConstructor();

  Future <void> _onCreate(Database db, int version) async
  {
    await db.execute('''
          CREATE TABLE $table1 (
            $columnId INTEGER PRIMARY KEY,
            $columnname TEXT NOT NULL 
          )
          ''');

    await db.execute('''
          CREATE TABLE $table2 (
            $columnId1 INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL ,
            $columnLName TEXT NOT NULL ,
            $columnMobile TEXT NOT NULL ,
            $columnEmail TEXT NOT NULL ,
            $columnCategory TEXT NOT NULL ,
            $columnProfile TEXT NOT NULL 
             )
          ''');
  }

  Future<Database>get database async => _database ??= await _initDatabase();

  _initDatabase()async
  {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }
  Future<Database?> get database1 async
  {
    if (_database == null)
    {
      _database = await _initDatabase();
    }
    return _database;
  }


  Future<int>insertdata(Map<String, dynamic> row)async
  {
    Database? db = await instance.database;
    return await db.insert(table1, row);
  }
}