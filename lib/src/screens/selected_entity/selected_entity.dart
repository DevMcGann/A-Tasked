import 'package:flutter/material.dart';
import 'package:taskmanager/src/bloc/entidades_Bloc.dart';
import 'package:taskmanager/src/models/entidad_model.dart';
import 'package:taskmanager/src/screens/home/widgets/header.dart';
import 'package:taskmanager/src/screens/selected_entity/selected_entity_widgets/selected_actionButtons.dart';
import 'package:taskmanager/src/screens/selected_entity/selected_entity_widgets/task_list.dart';


class SelectedEntity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final entidadeBloc = new EntidadesBloc();
  final Entidad entidad = ModalRoute.of(context).settings.arguments;
  entidadeBloc.setEntidadSeleccionada(entidad.id);
 
  

    return Scaffold(
      appBar: AppBar(),
  
      body: SingleChildScrollView(
        child: Container(
         child: Column(
          children: [
            header(context, "assets/images/blackboard.png",entidad.name, 60, 0.17),
           
            Container(
                  height: MediaQuery.of(context).size.height * 0.58,
                  child: TaskList()
                ),
          ],
        ),
        ),
      ),
      floatingActionButton: selectedScreenActionButtons(context),
      
    );
  }
}