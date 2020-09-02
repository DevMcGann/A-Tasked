import 'package:flutter/material.dart';
import 'package:taskmanager/src/screens/home/widgets/add_new_entity_modal.dart';

Widget actionButtons(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.add),
            onPressed: ()=> addEntity(context),
            ),

          SizedBox(width: 20),
          
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.build),
            onPressed: ()=> Navigator.pushNamed(context, 'home_options')),    
      ],
      );
}