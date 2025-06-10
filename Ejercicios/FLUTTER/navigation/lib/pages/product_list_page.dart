import 'package:flutter/material.dart';
import 'package:navigation/pages/pr_productos_pages.dart';

class ProductListPages extends StatelessWidget {
  ProductListPages({super.key});

  final List<Product> products = [
    Product(
      name: "Producto 1",
      price: 10,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 2",
      price: 10,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 3",
      price: 10,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 4",
      price: 10,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 5",
      price: 10,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 6",
      price: 10,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 7",
      price: 10,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 8",
      price: 1,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 9",
      price: 50,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 10",
      price: 40,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 11",
      price: 20,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 11",
      price: 20,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 11",
      price: 20,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 11",
      price: 20,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 11",
      price: 20,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 11",
      price: 20,
      description: "Descripcion producto1",
    ),
    Product(
      name: "Producto 11",
      price: 20,
      description: "Descripcion producto1",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan, title: Text("Lista de productos")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text(products[index].description),
            trailing: Text('\$${products[index].price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
