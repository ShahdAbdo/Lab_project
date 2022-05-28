import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'note.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';



class NoteProvider with ChangeNotifier, DiagnosticableTreeMixin {
 
  static final NoteProvider nb = NoteProvider();

    List<Note> _notes = [];
    static Database? _db ;
    Future<Database?> get databases async{
      if(_db==null){
        _db = await init();
        return _db;
      }
      else{
        return _db;
      }
    }

  List<Note> get notes => _notes;


   init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "notes.db");
  
    Database mydb= await openDatabase(
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE Notes(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT)""");
          
    });
    return mydb;
  }
 Future<int>  addItem({required Note item}) async {
  Database? db = await databases;

   return await db!.insert(
    "Notes",
    item.toMap(),
    conflictAlgorithm: ConflictAlgorithm.ignore,
  ) ;

   
  
}
void getNotes() async{ 
    
Database? db = await databases;
    db!.query("Notes").then((list) {
     _notes = List.generate(list.length, (i) { 
      return Note.fromMap(list[i]);
    }); 
    notifyListeners();
  });
  }

Future<int> deleteNote(int id) async{ 
Database? db = await databases;  
  return await   db!.delete(
      "Notes", 
      where: "id = ?",
      whereArgs: [id] 
    );
  }
  
Future<int>  updateNote({required int id,required Note item}) async{ 
  
Database? db = await databases;  
   return await db!.update(
      "Notes", 
      item.toMap(),
      where: "id = ?",
      whereArgs: [id]
      );
      
 }

}




