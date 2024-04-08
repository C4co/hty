class Product {
  Product({
    required this.name,
    required this.description,
    required this.price,
    this.id,
  });

  int? id;
  String name;
  String description;
  double price;

  Map<String, String> toJson() {
    return {
      'id': id.toString(),
      'name': name,
      'description': description,
      'price': price.toString(),
    };
  }
}
