import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/stores.dart';
import 'package:flutter_catalog/modles/cart.dart';
import 'package:flutter_catalog/modles/catalog.dart';
// ignore: unused_import, import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [AddMutation, RemoveMutation]);
    final CartModle _cart = (VxState.store as MyStores).cart;
    bool isIncart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isIncart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xff403b58)),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: isIncart
            ? const Icon(Icons.done)
            : const Icon(CupertinoIcons.cart_badge_plus));
  }
}
