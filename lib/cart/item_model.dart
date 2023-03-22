class Item {
  final String name;
  final String service;
  final int price;
  final String image;
  Item(
      {required this.name,
      required this.service,
      required this.price,
      required this.image});

  Map toJson() {
    return {
      'name': name,
      'service': service,
      'price': price,
      'image': image,
    };
  }
}
