import 'package:flutter/material.dart';
import 'package:taskmanager/src/screens/home/widgets/header.dart';


Future<void> dialogBox(BuildContext context, String headerTitle, String message) async {

  

  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: header(context, "assets/images/todolist.png", headerTitle, 30, 0.20),
        
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              

              Text(message,
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
       
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: FlatButton(
              child: Text('Accept',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}
