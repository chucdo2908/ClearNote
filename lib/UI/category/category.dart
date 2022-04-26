import 'package:appclearnote/UI/Home/home.dart';
import 'package:appclearnote/Widget/checklistcategory.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white38,
          ),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Align(
          child: Text(
            'Category',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white38,
            ),
          ),
          alignment: Alignment.center,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.brush,
              color: Colors.white60,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
                child: ListView(
              children: [
                Card(
                  color: Colors.black,
                  child: ListTile(
                    title: Text(
                      'All note',
                      style: TextStyle(
                          color: Colors.white38,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Card(
                  color: Colors.black,
                  child: ListTile(
                    title: Text(
                      'Uncategorized notes',
                      style: TextStyle(
                          color: Colors.white38,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
                  Navigator.of(context).pop();
            },
            ),
          ),
          FloatingActionButton(
            onPressed: () => displayDialogCategory(context),
            backgroundColor: Colors.black,
            child: Icon(
              Icons.add,
              color: Colors.amber,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
