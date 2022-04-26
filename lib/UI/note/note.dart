import 'dart:math';
import 'package:uuid/uuid.dart';
import 'package:appclearnote/Models/model_note.dart';
import 'package:appclearnote/UI/Home/home.dart';
import 'package:flutter/material.dart';

import '../../Boxes.dart';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  String id = '';
  String title = '';
  String noidung = '';
  var mau = [0xFF71b8ff,0xFFff6374,0xFFffaa5b,0xFF9ba0fc];
  final random = new Random();
  double font = 18;
  int back =0;
  void _tangfont() {
  setState(() {
    var rnd = random.nextInt(mau.length);
    back = mau[rnd];
    if(font>35){
      font = 18;
    }else{
      font = font + 5;
    }
  });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(back),
        appBar: AppBar(
          backgroundColor: Color(back),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white38,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.hdr_auto_sharp,
                color: Colors.white38,
              ),
              onPressed: _tangfont,
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  title = value;
                },
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(color: Colors.white70),
                ),
                validator: (title) => title != null && title.isEmpty
                    ? 'The title cannot be empty'
                    : null,
              ),
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    noidung = value;
                  },
                  maxLines: 23,
                  style: TextStyle(color: Colors.white60, fontSize: font),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type something...',
                    hintStyle: TextStyle(color: Colors.white60,fontSize: font),
                  ),
                  validator: (title) => title != null && title.isEmpty
                      ? 'The description cannot be empty'
                      : null,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  // int Color = 0;
                  //   var rnd = random.nextInt(mau.length);
                    setState(() {
                      // Color = mau[rnd];
                      const uid = Uuid();
                      id = uid.v1();
                    });
                    _tangfont();

                 addNote(id, title, noidung, back,font);
                 Navigator.pop(context,
                 MaterialPageRoute(builder: (context) => Home()),
                 );
                },
                backgroundColor: Colors.white,
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.pink),
                ),
              ),
            ],
          ),
        ));
  }
}
Future addNote(String id ,String title , String noidung, int Color, double font) async{
  final product = Product()
    ..id = id
    ..title = title
    ..noidung = noidung
    ..Color = Color
    ..font = font;
  final box = Boxes.getTransactions();
  box.add(product);
}
