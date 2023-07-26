
import 'dart:ui';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:sqlite_using_notes_app/notes.dart';
import 'package:path/path.dart';

class DBHelper{

  static Database? _db;

  Future<Database?> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }
  initDatabase()async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'notes,db');
    var db= await openDatabase(path, version: 1, onCreate: _onCreate );
    return db;
  }
  _onCreate (Database db, int version)async{
    await db.execute(
      'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, age INTEGER NOT NULL , description TEXT NOT NULL, email TEXT)',
    );
  }


  //Insert Notes
  Future<NotesModel> insert(NotesModel notesModel)async{
   var dbClient = await db;
   await dbClient!.insert('notes', notesModel.toMap());
    return notesModel;
  }



}