import 'package:appclearnote/Boxes.dart';
import 'package:appclearnote/Models/model_note.dart';
import 'package:appclearnote/UI/Home/home.dart';
import 'package:flutter/material.dart';

class EditNote1 extends StatefulWidget {
  Product product;

  EditNote1(this.product);

  @override
  _EditNote1State createState() => _EditNote1State();
}

class _EditNote1State extends State<EditNote1> {
  String title = '';
  String noidung = '';

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
          icon: Icon(Icons.clear),
          color: Colors.white60,
        ),
        title: TextFormField(
          initialValue: widget.product.title,
          onChanged: (value) {
             title = value;
          },
          maxLines: 1,
          style: TextStyle(color: Colors.white60, fontSize: 25),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          validator: (title) => title != null && title.isEmpty
              ? 'The description cannot be empty'
              : null,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.refresh_rounded,
              color: Colors.white60,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: widget.product.noidung,
                onChanged: (value) {
                  noidung = value;
                },
                maxLines: 23,
                style: TextStyle(color: Colors.white60, fontSize: widget.product.font),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                validator: (title) => title != null && title.isEmpty
                    ? 'The description cannot be empty'
                    : null,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
                update(widget.product, widget.product.id, title, noidung,
                    widget.product.Color);
              },
              backgroundColor: Colors.black,
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void update(
    Product product, String id, String title, String noidung, int color) {
  product.id = id;
  product.title = title;
  product.noidung = noidung;
  product.Color = color;
  final box = Boxes.getTransactions();
  box.put(product.key, product);
  product.save();
}
