


import 'dart:async';



import 'package:taskmanager/src/bloc/entidades_Bloc.dart';
import 'package:taskmanager/src/models/task_model.dart';
import 'package:taskmanager/src/providers/DBProvider.dart';

class TareasBloc   {     
  final entidadBloc = EntidadesBloc();
   static final TareasBloc _singleton = new TareasBloc._internal();

  factory TareasBloc(){
    return _singleton;
  }

  TareasBloc._internal(){
    //obtener tareas de la db
       getAllTasks();
  }

  final _tareasStreamController = StreamController<List<Task>>.broadcast();
  
   //STREAM
   Stream<List<Task>> get tareasStream => _tareasStreamController.stream;  //.transform(validarTarea)

  dispose(){
    _tareasStreamController?.close();
  }

    getAllTasks() async {
      int entidadSeleccionada = entidadBloc.getEntidadSeleccionada();
    _tareasStreamController.sink.add(await DBProvider.db.getAllTasksByOwnerId(entidadSeleccionada));
    }

    Future<Task> getTaskById() async {
     final Task task =  await DBProvider.db.getTaskById(entidadBloc.getEntidadSeleccionada());
     return task; 
    }

    agregarTask(Task task) async {
    await DBProvider.db.newTask(task);
   getAllTasks();
  }

  borrarTask(int id) async {
    await DBProvider.db.deleteTask(id);
    getAllTasks();
  }

  borrarTodasTareas(int creatorId) async {
    await DBProvider.db.deleteAllTaskByCreatorId(creatorId);
    getAllTasks();
  }

  cambiarEstadoTarea(int id) async {
    Task task = await DBProvider.db.getTaskById(id);
    final taskStatus = task.completed;
    int newStatus;

    if (taskStatus == 0){
      newStatus = 1;
    }else{
      newStatus=0;
    }

    await DBProvider.db.changeTaskStatus(id, newStatus);
    getAllTasks();
  }

  marcarTodasCompletas(int ownerId) async {
    await DBProvider.db.markAllTasksCompleted(ownerId);
    getAllTasks();
  }

    marcarTodasIncompletas(int ownerId) async {
    await DBProvider.db.markAllTasksIncompleted(ownerId);
    getAllTasks();
  }
}



