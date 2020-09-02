import 'package:flutter/material.dart';
import 'package:taskmanager/src/bloc/entidades_Bloc.dart';
import 'package:taskmanager/src/models/entidad_model.dart';
import 'package:taskmanager/src/screens/home/widgets/header.dart';


Future<void> addEntity(BuildContext context) async {
  final textController = TextEditingController();
  final entidadedBloc = new EntidadesBloc();
  

  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        
        title: header(context, "assets/images/todolist.png", "Add an Entity", 40, 0.30),
        
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Name',
                  hintStyle: TextStyle(fontSize: 20),
                 ),
                ),

              SizedBox(height: 20,),

              Text('Name an Entity which will contain a group of tasks',
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
                String nombreEntidad = textController.text;
                if (nombreEntidad == '') nombreEntidad='Unknow'; 
                final newEntity = Entidad(
                  name: nombreEntidad
                );
                entidadedBloc.agregarEntidad(newEntity);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}
