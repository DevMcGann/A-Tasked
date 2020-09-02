


import 'dart:async';

import 'package:taskmanager/src/models/entidad_model.dart';
import 'package:taskmanager/src/providers/DBProvider.dart';



class EntidadesBloc {
   static final EntidadesBloc _singleton = new EntidadesBloc._internal();

  factory EntidadesBloc(){
    return _singleton;
  }

  EntidadesBloc._internal(){
    //obtener entidades de la db
    getEntidades();
  }

  int entidadSeleccionada; 

  setEntidadSeleccionada(int id){
    entidadSeleccionada = id;
  }

  getEntidadSeleccionada(){
    return entidadSeleccionada;
  }

  final _entidadesStreamController = StreamController<List<Entidad>>.broadcast();

   Stream<List<Entidad>> get entidadesStream => _entidadesStreamController.stream;

  dispose(){
    _entidadesStreamController?.close();
  }

    getEntidades() async {
    _entidadesStreamController.sink.add(await DBProvider.db.getEntidades());
    }

    Future<Entidad> getEntidadById(id) async {
     final Entidad entidad =  await DBProvider.db.getEntidadById(id);
     return entidad; 
    }

    agregarEntidad(Entidad entity) async {
    await DBProvider.db.newEntity(entity);
   getEntidades();
  }

  borrarEntidad(int id) async {
    await DBProvider.db.deleteEntity(id);
    await DBProvider.db.deleteAllTaskByCreatorId(id);
    getEntidades();
  }

  borrarTodasEntidades() async {
    await DBProvider.db.deleteAllEntitys();
    await DBProvider.db.deleteAllTasks();
    getEntidades();
  }

}



