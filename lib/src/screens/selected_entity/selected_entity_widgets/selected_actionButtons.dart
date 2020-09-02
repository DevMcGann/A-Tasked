import 'package:flutter/material.dart';
import 'package:taskmanager/src/screens/selected_entity/selected_entity_widgets/add_new_task_modal.dart';

Widget selectedScreenActionButtons(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.add),
            onPressed: ()=> addTask(context),
            ),

          SizedBox(width: 20),
          
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.build),
            onPressed:()=>  Navigator.pushNamed(context, 'tasks_options')),    
      ],
      );
}