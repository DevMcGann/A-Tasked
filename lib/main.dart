import 'package:flutter/material.dart';
import 'package:taskmanager/src/screens/instructions/instructions_screen.dart';
import 'package:taskmanager/src/screens/options_home/options_home_screen.dart';
import 'package:taskmanager/src/screens/options_tasks/task_options_screen.dart';



import 'src/screens/home/home_screen.dart';
import 'src/screens/selected_entity/selected_entity.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gsoft Task Manager',
      initialRoute: 'home',
      routes: {
        'home':(BuildContext context) => HomeScreen(),
        'selected_entity':(BuildContext context) => SelectedEntity(),
        'home_options':(BuildContext context) => OptionsHomeScreen(),
        'instructions':(BuildContext context) => InstructionsScreen(),
        'tasks_options':(BuildContext context) => TasksOptionsScreen(),
      },
    );
  }
}