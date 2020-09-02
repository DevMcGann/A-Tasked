import 'package:flutter/material.dart';
import 'package:taskmanager/src/bloc/entidades_Bloc.dart';
import 'package:taskmanager/src/utils/dialogbox.dart';

class OptionsHomeScreen extends StatelessWidget {
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

            _deleteAllEntities(context),

            SizedBox(height: 20,),

            _instructions(context),

            SizedBox(height: 20,),

            _aboutDeveloper(context)


          ],
        ),
      ),
      );
  }

  InkWell _deleteAllEntities(BuildContext context) {
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
                    Text("Delete All Entities", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.white),)
                  ],
                ),
              ) ,
              ),
            onTap: (){
              entidadesBloc.borrarTodasEntidades();
              dialogBox(context, 'Deleting!', 'All the Entities has been deleted :)');
            },
            enableFeedback: true,
          );
  }

InkWell _instructions(BuildContext context) {
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
                    Icon(Icons.info, size:70, color: Colors.white,),
                    Text("Need Instructions?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.white),)
                  ],
                ),
              ) ,
              ),
            onTap: ()=> Navigator.pushNamed(context, 'instructions'),
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

}