

import 'package:appclearnote/UI/note/note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'checklistdialog.dart';

void showdialog(BuildContext context) {
  showDialog(context: context, builder: (_){
    return SimpleDialog(
      children: [
        SimpleDialogOption(
          child: Text('Note'),
          onPressed: () {
            Navigator.of(context).pop();
             Navigator.push(context,
             MaterialPageRoute(builder: (context) => Note()),
             );

          },
        ),
        SimpleDialogOption(
          child: Text('Checklist'),
          onPressed: () => displayDialog(context),
        ),
      ],
    );
  });
}