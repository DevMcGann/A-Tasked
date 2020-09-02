import 'package:flutter/material.dart';
import 'package:taskmanager/src/bloc/entidades_Bloc.dart';
import 'package:taskmanager/src/models/entidad_model.dart';



class EntityList extends StatelessWidget {

  final entityBloc = new EntidadesBloc();

  @override
  Widget build(BuildContext context) {

    entityBloc.getEntidades();

    return StreamBuilder<List<Entidad>>(
      stream: entityBloc.entidadesStream,
      builder: (BuildContext context, AsyncSnapshot<List<Entidad>> snapshtop ){
        if(!snapshtop.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        final entidades = snapshtop.data;

        if (entidades.length == 0 ){
          return Center(child: Text("There are no Entities", style: TextStyle(fontSize: 30),),);
        }

        return ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: entidades.length,
          itemBuilder: (context, i) =>
           Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              onDismissed: (direction) => entityBloc.borrarEntidad(entidades[i].id),
              child: Container(
                margin: EdgeInsets.only(top:30),
                child: ListTile(
                leading: Image.asset("assets/images/task.png"), 
                title: Text(entidades[i].name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                trailing: Icon(Icons.forward, size: 40, color: Colors.green,),
                onTap: ()=> Navigator.pushNamed(context, 'selected_entity', arguments: entidades[i]),

            ),
              ),
          ), 
          );
      }
      );
  }
}