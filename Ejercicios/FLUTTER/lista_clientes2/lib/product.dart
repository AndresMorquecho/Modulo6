class Product {
  final int id;
  final String name;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {'ID': id, 'NAME': name, 'PRICE': price, 'DESCRIPTION': description};
  }
}
