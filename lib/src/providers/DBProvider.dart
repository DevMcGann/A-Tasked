

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taskmanager/src/models/entidad_model.dart';
import 'package:taskmanager/src/models/task_model.dart';

class DBProvider{

  static Database _database; 
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {

    if ( _database != null ) return _database;

    _database = await initDB();
    return _database;
  }


  initDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentsDirectory.path, 'TaskManagerDB.db' );

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: ( Database db, int version ) async {
         await db.execute(
      'CREATE TABLE entidades (id INTEGER PRIMARY KEY, name TEXT)');
        
        await db.execute(
          'CREATE TABLE tareas (id INTEGER PRIMARY KEY, creatorId INTEGER, taskName TEXT, completed INTEGER)'
        );
      }
    
    );

  }

  // ----------------------------------Create data-----------------------------//
   newEntity( Entidad entidad ) async {
    final db  = await database;

    final res = await db.rawInsert(
      "INSERT Into entidades (id, name) "
      "VALUES ( ${ entidad.id }, '${ entidad.name }' )"
    );
    return res;
  }

  newTask ( Task task) async {
    final db = await database;

    final res = await db.rawInsert(
       "INSERT Into tareas (id, creatorId, taskName, completed) "
      "VALUES ( ${ task.id }, '${ task.creatorId }', '${ task.taskName }', '${ task.completed = 0}' )"
    );
    return res;
  }


  // ----------------------------------Show data-----------------------------//
  Future<Entidad> getEntidadById( int id ) async {
    final db  = await database;
    final res = await db.query('entidades', where: 'id = ?', whereArgs: [id]  );
    return res.isNotEmpty ? Entidad.fromJson( res.first ) : null;
  }

  Future<Task> getTaskById( int id ) async {
    final db  = await database;
    final res = await db.query('tareas', where: 'id = ?', whereArgs: [id]  );
    return res.isNotEmpty ? Task.fromJson( res.first ) : null;
  }

  Future<List<Task>> getAllTasksByOwnerId (int creatorId) async {
    final db = await database;
    final res = await db.query('tareas', where: 'creatorId = ?', whereArgs: [creatorId] );

    List<Task> list = res.isNotEmpty
              ? res.map( (c) => Task.fromJson(c) ).toList()
              : [];           
    return list;
  }

  Future<List<Entidad>> getEntidades() async {
    final db  = await database;
    final res = await db.query('entidades');

    List<Entidad> list = res.isNotEmpty 
                              ? res.map( (c) => Entidad.fromJson(c) ).toList()
                              : [];
    return list;
  }

  Future<List<Task>> getTasks() async {
    final db  = await database;
    final res = await db.query('tareas');

    List<Task> list = res.isNotEmpty 
                              ? res.map( (c) => Task.fromJson(c) ).toList()
                              : [];
    return list;
  }



// ----------------------------------Delete data-----------------------------//
 Future<int> deleteEntity( int id ) async {

    final db  = await database;
    final res = await db.delete('entidades', where: 'id = ?', whereArgs: [id]);
    return res;
    
  }

  Future<int> deleteAllEntitys() async {

    final db  = await database;
    final res = await db.rawDelete('DELETE FROM entidades');
    return res;
  }


 Future<int> deleteTask( int id ) async {

    final db  = await database;
    final res = await db.delete('tareas', where: 'id = ?', whereArgs: [id]);
    return res;
  }

   Future<int> deleteAllTaskByCreatorId( int creatorId ) async {

    final db  = await database;
    final res = await db.delete('tareas', where: 'creatorId = ?', whereArgs: [creatorId]);
    return res;
  }
  
  Future<int> deleteAllTasks( ) async {
    final db  = await database;
    final res = await db.rawDelete('DELETE FROM tareas');
    return res;
  }

Future<int> changeTaskStatus (int id, int newState) async{
  final db = await database;
  final res = await db.rawUpdate('UPDATE tareas SET completed = $newState WHERE id = $id');
  return res;
}

Future<int> markAllTasksCompleted(int creatorId) async {
  final db = await database;
  final res = await db.rawUpdate('UPDATE tareas SET completed = 1 WHERE creatorId = $creatorId');
  return res;
}

Future<int> markAllTasksIncompleted(int creatorId) async {
  final db = await database;
  final res = await db.rawUpdate('UPDATE tareas SET completed = 0 WHERE creatorId = $creatorId');
  return res;
}

}