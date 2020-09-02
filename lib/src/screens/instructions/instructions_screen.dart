import 'package:flutter/material.dart';

class InstructionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(title: Text("Instructions"),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width:double.infinity, height: 20,),
            Container(
              padding: EdgeInsets.all(18),
              color:Colors.blue[300],
              height: 200,
              width: MediaQuery.of(context).size.width * .8,
              child: SingleChildScrollView(child: Text("An Entity, is just a Task container, and to add one, tap the + button on the bottom right corner, and then, Name your entity in the new Dialog box, and push Add ", style: TextStyle(color:Colors.white, fontSize: 20))),
              
            ),

            SizedBox(height:20),

             Container(
              padding: EdgeInsets.all(18),
              color:Colors.blue[300],
              height: 200,
              width: MediaQuery.of(context).size.width * .8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("To delete an entity or a task,  just swipe it to the left or to the right ", style: TextStyle(color:Colors.white, fontSize: 20)),
                    SizedBox(height:13),
                    Image.asset("assets/images/deleteAnEntityOrTask.png")
                  ],
                ),
              ) 
            ),

            SizedBox(height:20),

            Container(
              padding: EdgeInsets.all(18),
              color:Colors.blue[300],
              height: 200,
              width: MediaQuery.of(context).size.width * .8,
              child: SingleChildScrollView(child: Text("If you want to delete ALL the entities, just tap the Options button on the bottom right corner, and click on Delete all Entities button. ", style: TextStyle(color:Colors.white, fontSize: 20))),
            ),

            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.all(18),
              color:Colors.blue[300],
              height: 200,
              width: MediaQuery.of(context).size.width * .8,
              child: SingleChildScrollView(child: Text("To delete all task of an Entity, tap the options button of that entity and then tap the Delete all tasks button  ", style: TextStyle(color:Colors.white, fontSize: 20))),
            ),

            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.all(18),
              color:Colors.blue[300],
              height: 200,
              width: MediaQuery.of(context).size.width * .8,
              child: SingleChildScrollView(child: Text("If you want to mark all task as completed, or all task as incompleted, go to options menu of an entity, and tap the buttons", style: TextStyle(color:Colors.white, fontSize: 20))),
            ),
            SizedBox(height:70)
          ],
        ),
      ),
    );
  }
}