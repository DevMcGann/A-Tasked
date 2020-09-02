import 'package:flutter/material.dart';
import 'package:taskmanager/src/screens/home/widgets/actionButtons.dart';
import 'package:taskmanager/src/screens/home/widgets/entity_list.dart';
import 'widgets/header.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            children: [
                header(context, "assets/images/todolist.png", "A-Tasked", 80, 0.35),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: EntityList()
                ),
          ],
          ),
        ),
      ),
      floatingActionButton: actionButtons(context),
        
    );
  }
} //end