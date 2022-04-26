import 'package:appclearnote/Boxes.dart';
import 'package:appclearnote/Models/model_note.dart';
import 'package:appclearnote/UI/category/category.dart';
import 'package:appclearnote/Widget/List_data.dart';
import 'package:appclearnote/Widget/dialog.dart';
import 'package:appclearnote/Widget/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white38,
          ),
          onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Category())
              );
          },
        ),
        title: Align(
          child: Text(
            'ClearNote' ,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white38,
            ),
          ),
          alignment: Alignment.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context, delegate: SearchBar(),
              );
          },
            icon: Icon(Icons.search,color: Colors.white60,),
          ),
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.more_vert,color: Colors.white60,),
          ),
        ],
      ),
      body: ValueListenableBuilder<Box<Product>>(
        valueListenable: Boxes.getTransactions().listenable(),
        builder: (context,box, _){
          final product = box.values.toList().cast<Product>();
          final title  = box.values.toList().cast<Title>();
          return Column(
            children: [
              SizedBox(height: 10,),
              Expanded(
                child: buildGrid(product,context),
              ),
              FloatingActionButton(
                onPressed: () => showdialog(context),
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.add,
                  color: Colors.amber,
                  size: 40,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

