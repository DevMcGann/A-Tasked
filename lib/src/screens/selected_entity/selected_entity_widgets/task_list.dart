import 'package:flutter/material.dart';
import 'package:taskmanager/src/bloc/tareas_Bloc.dart';
import 'package:taskmanager/src/models/task_model.dart';



class TaskList extends StatelessWidget {
  final taskBloc = new TareasBloc();

  @override
  Widget build(BuildContext context) {

    taskBloc.getAllTasks();
  
    return StreamBuilder<List<Task>>(
      stream: taskBloc.tareasStream,
      builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshtop ){
        if(!snapshtop.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        final tareas = snapshtop.data;

        if (tareas.length == 0 ){
          return Center(child: Text("There are no Tasks yet", style: TextStyle(fontSize: 30),),);
        }

        return ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: tareas.length,
          itemBuilder: (context, i) =>
           Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              onDismissed: (direction) => taskBloc.borrarTask(tareas[i].id),
              child: Container(
                margin: EdgeInsets.only(top:20),
                child: ListTile(
                leading: tareas[i].completed == 0? Image.asset("assets/images/incomplete.png") :Image.asset("assets/images/completed.png") , 
                title: Text(tareas[i].taskName, style: TextStyle(fontSize: 23),),
                onTap: ()=> taskBloc.cambiarEstadoTarea(tareas[i].id)
            ),
              ),
          ), 
          );
      }
      );
  }

 
}