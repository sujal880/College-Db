import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static String tablename="note_table";
  static String columnid="note_id";
  static String columntitle="note_title";
  static String columndesc="note_desc";

  Future<Database>getdb()async{
    Directory directory=await getApplicationDocumentsDirectory();
    var dbpath=join(directory.path+"notesdb.db");
    return openDatabase(dbpath,version: 1,onCreate: (db,version){
      return db.execute("create table $tablename ( $columnid integer primary key autoincrement, $columntitle text, $columndesc text ) ");
    });
  }
  addData(String title,String desc)async{
    var db=await getdb();
    db.insert(tablename, {
      DbHelper.columntitle:title,
      DbHelper.columndesc:desc
    });
  }
}