import 'package:appclearnote/Boxes.dart';
import 'package:appclearnote/Models/model_note.dart';
import 'package:appclearnote/UI/editNote/edit_note.dart';
import 'package:flutter/material.dart';

class SearchBar extends SearchDelegate<Product>  {
  List item = [

    Boxes.getTransactions().getAt(0),
    Boxes.getTransactions().getAt(1),
    Boxes.getTransactions().getAt(2),
    Boxes.getTransactions().getAt(3),
  ].toList();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listitems = query.isEmpty ? item
        : item
        .where((element) =>
        element.title.toLowerCase()
            .startsWith(query.toLowerCase().toString())).toList();
    return listitems.isEmpty
        ? Center(child: Text('No data')) : GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: listitems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(listitems[index].Color),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Text(
                      listitems[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                      ),
                    ),
                    Text(
                      listitems[index].noidung.toString(),
                      maxLines: 5,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditNote(listitems[index]))
                );
            },
          );
        });
  }

}
