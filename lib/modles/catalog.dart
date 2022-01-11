class Catalog {
  static List<Item> items = [];

  Item getById(int id) =>
      // ignore: null_closures
      items.firstWhere((element) => element.id == id, orElse: null);
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  // Item(
  //     {this.id = 0,
  //     this.name = '',
  //     this.desc = '',
  //     this.price = 100,
  //     this.color = '#33505a',
  //     this.image = ''});

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
