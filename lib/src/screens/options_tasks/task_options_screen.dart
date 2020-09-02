import 'package:flutter/material.dart';
import 'package:taskmanager/src/bloc/entidades_Bloc.dart';
import 'package:taskmanager/src/bloc/tareas_Bloc.dart';
import 'package:taskmanager/src/utils/dialogbox.dart';

class TasksOptionsScreen extends StatelessWidget {



  final tareasBloc = TareasBloc();
  final entidadesBloc = EntidadesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(title: Text("Options"),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            SizedBox(height:20,width: double.infinity,),

            _deleteAllTasks(context),

            SizedBox(height: 20,),

            _markAllCompleted(context, entidadesBloc.getEntidadSeleccionada()),

            SizedBox(height: 20,),

            _markAllIncompleted(context, entidadesBloc.getEntidadSeleccionada()),

            SizedBox(height:20),

            _aboutDeveloper(context)


          ],
        ),
      ),
      );
  }

  InkWell _deleteAllTasks(BuildContext context) {
    return InkWell(
              child: Card(
              elevation: 4,
              color: Colors.red[300],
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0),),
              child: Container(
                height:100,
                width: MediaQuery.of(context).size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.delete_forever, size:70, color:Colors.white),
                    Text("Delete All Tasks for this Entity", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:Colors.white),)
                  ],
                ),
              ) ,
              ),
            onTap: (){
              tareasBloc.borrarTodasTareas(entidadesBloc.getEntidadSeleccionada());
              dialogBox(context, 'Deleting!', 'All the Tasks of this Entity has been deleted :)');
            },
            enableFeedback: true,
          );
  }

  InkWell _markAllCompleted(BuildContext context, int ownerID) {
    return InkWell(
              child: Card(
              elevation: 4,
              color: Colors.blue,
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0),),
              child: Container(
                height:100,
              width: MediaQuery.of(context).size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Icon(Icons.delete_forever, size:70, color:Colors.white),
                    Image.asset("assets/images/completed.png"),
                    Text("All Tasks as Completed", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:Colors.white),)
                  ],
                ),
              ) ,
              ),
            onTap: (){
              tareasBloc.marcarTodasCompletas(ownerID);
              dialogBox(context, 'Completed!', 'All Tasks has been marked as Completed');
            },
            enableFeedback: true,
          );
  }

  InkWell _markAllIncompleted(BuildContext context, int ownerID) {
    return InkWell(
              child: Card(
              elevation: 4,
              color: Colors.blue,
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0),),
              child: Container(
                height:100,
                width: MediaQuery.of(context).size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Icon(Icons.delete_forever, size:70, color:Colors.white),
                    Image.asset("assets/images/incomplete.png"),
                    Text(" All Tasks as Incompleted", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:Colors.white),)
                  ],
                ),
              ) ,
              ),
            onTap: (){
              tareasBloc.marcarTodasIncompletas(ownerID);
              dialogBox(context, 'Incompleted', 'All Tasks has been marked as Incompleted)');
            },
            enableFeedback: true,
          );
  }



  Widget _aboutDeveloper(BuildContext context){
    return 
        Card(
          elevation:3,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0),),
          child: (
        Container(
          height:MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 1,
          color:Colors.black,
          child: Column(
            children: [
              Image.asset("assets/images/gsoft.jpg", fit: BoxFit.contain,),
              SizedBox(height:MediaQuery.of(context).size.height * 0.06,),
              Text("Develped by GSOFT 2020", 
              style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
              )
            ],
          ),
        )
      ),
    );
  }


}//general