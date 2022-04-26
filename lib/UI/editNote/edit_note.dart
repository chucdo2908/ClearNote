import 'package:appclearnote/Models/model_note.dart';
import 'package:appclearnote/UI/editNot1/edit_note1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

class EditNote extends StatefulWidget {
  Product product;
  EditNote(this.product);

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(widget.product.Color),
      appBar: AppBar(
        backgroundColor: Color(widget.product.Color),
        leading: IconButton(
            onPressed: () {
                Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white60,
              size: 20,
            ),
          ),
        actions: [
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(
                    Icons.hdr_auto_sharp,
                    color: Colors.white60,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(
                    Icons.circle,
                    color: Colors.white60,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white60,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                      screenLock(
                        correctString: '1234',
                        context: context,
                        canCancel: false,

                      );
                  },
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white60,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.product.delete();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white60,
                    size: 15,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditNote1(widget.product))
                    );
                  },
                  icon: Icon(
                    Icons.brush,
                    color: Colors.white60,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(
                    Icons.note,
                    color: Colors.white60,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30,left: 20),
        child: Column(
          children: [
            Text(
                'Category',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              widget.product.title,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              child:  Text(
                widget.product.noidung,
                style: TextStyle(
                    fontSize: widget.product.font,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
              ),
              onDoubleTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditNote1(widget.product))
                    );
              },
            ),
          ],
        ),
      ),

    );
  }
}
