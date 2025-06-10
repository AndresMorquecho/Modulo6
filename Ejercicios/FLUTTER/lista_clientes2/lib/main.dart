import 'package:flutter/material.dart';
import 'package:lista_clientes2/pages/product_form.dart';
import 'package:lista_clientes2/pages/product_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(),
      routes: {'/add': (ctx) => ProductForm()},
    );
  }
}
