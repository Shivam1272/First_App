// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/modles/cart.dart';
import 'package:flutter_catalog/modles/catalog.dart';

class MyStores extends VxStore {
  late Catalog catalog;
  late CartModle cart;

  MyStores() {
    catalog = Catalog();
    cart = CartModle();
    cart.catalog = catalog;
  }
}
