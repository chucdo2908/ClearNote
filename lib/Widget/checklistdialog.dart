

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void displayDialog(BuildContext context){
  showDialog(context: context, builder: (_){
    return AlertDialog(
      content: TextField(
        controller: TextEditingController(),
        decoration: InputDecoration(hintText: 'Title'),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Save')),
      ],
    );
  });
}