import 'package:appclearnote/Models/model_note.dart';
import 'package:appclearnote/UI/editNote/edit_note.dart';
import 'package:appclearnote/UI/note/note.dart';
import 'package:flutter/material.dart';

Widget buildGrid(List<Product> products, BuildContext context) {
  if (products.isEmpty) {
    return Center(
      child: Text(
        'Khong Co du lieu',
        style: TextStyle(fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w600),
      ),
    );
  } else {
    return GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, int index) {
          final product = products[index];
          return Card(context, product);
        });
  }
}


Widget Card(BuildContext context, Product product) {
  return InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>EditNote(product)));
    },
    child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(product.Color),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text(
            product.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
            ),
          ),
          Text(
            product.noidung.toString(),
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
  );
}