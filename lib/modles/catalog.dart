class Catalog {
  static final items = [
    Item(
        id: 1,
        name: " Iphone 13 pro max",
        desc: "Blue color 1TB storage ",
        price: "1190",
        imageurl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc",
        color: "#33505a")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String price;
  final String imageurl;
  final String color;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.imageurl,
      required this.color});
}
