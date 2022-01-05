import 'package:flutter/material.dart';
import 'package:flutter_catalog/modles/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          leading: Image.network(item.imageurl),
          title: Text(
            item.name,
            // ignore: prefer_const_constructors
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            item.desc,
            // ignore: prefer_const_constructors
            style: TextStyle(color: Colors.black),
          ),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.5,
          ),
        ),
      ),
    );
  }
}
