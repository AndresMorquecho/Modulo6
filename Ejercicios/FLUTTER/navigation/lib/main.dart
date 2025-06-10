import 'package:flutter/material.dart';
import 'package:navigation/pages/customers_page.dart';
import 'package:navigation/pages/home_page.dart';
import 'package:navigation/pages/listview_pages.dart';
import 'package:navigation/pages/product_list_page.dart';
import 'package:navigation/pages/productos_page.dart';
import 'package:navigation/pages/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        Routes.productos: (context) {
          return const ProductosPage();
        },
        Routes.customers: (ctx) {
          return const CustomersPage();
        },

        Routes.listview: (ctx) => const ListviewPages(),
        Routes.productListPage: (ctx) => ProductListPages(),

      },
    );
  }
}
