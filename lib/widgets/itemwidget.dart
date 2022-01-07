import 'package:flutter/material.dart';
import 'package:flutter_catalog/modles/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item})
      // ignore: unnecessary_null_comparison, unrelated_type_equality_checks
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          onTap: () {
            // ignore: avoid_print
            print("object pressed");
          },
          leading: Image.network(item.image),
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
