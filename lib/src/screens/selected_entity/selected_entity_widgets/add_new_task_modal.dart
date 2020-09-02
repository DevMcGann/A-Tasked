import 'package:flutter/material.dart';
import 'package:taskmanager/src/bloc/entidades_Bloc.dart';

import 'package:taskmanager/src/bloc/tareas_Bloc.dart';
import 'package:taskmanager/src/models/task_model.dart';
import 'package:taskmanager/src/screens/home/widgets/header.dart';


Future<void> addTask(BuildContext context) async {
  final textController = TextEditingController();
  final tareasBloc = new TareasBloc();
  final entidadesBloc = new EntidadesBloc();
  

  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        
        title: header(context, "assets/images/todolist.png", "Add a Task", 40, 0.35),
        
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Task',
                  hintStyle: TextStyle(fontSize: 20),
                 ),
                ),

              SizedBox(height: 20,),

              Text('Add a new Task',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
       
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: FlatButton(
              child: Text('Add',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              onPressed: () {
                String tarea = textController.text;
                if (tarea == '') tarea='Unknow'; 
                final task = Task(
                  creatorId: entidadesBloc.getEntidadSeleccionada(),
                  taskName: tarea,
                  completed: 0
                );
                tareasBloc.agregarTask(task);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}
