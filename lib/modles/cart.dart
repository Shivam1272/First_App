// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter_catalog/core/stores.dart';
import 'package:flutter_catalog/modles/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModle {
  late Catalog _catalog;
  final List<int> _itemid = [];

  Catalog get catalog => _catalog;

  set catalog(Catalog newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemid.map((id) => _catalog.getById(id)).toList();

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStores> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemid.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStores> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemid.remove(item.id);
  }
}
