import 'package:flutter/material.dart';
import 'package:navigation/pages/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text("Home Page")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.productos);
                // Navigator.push(context, route);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("ir a Productos"),
                  Icon(Icons.local_grocery_store_outlined),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.customers);
              },
              child: Column(
                children: [Text("ir a Clientes"), Icon(Icons.people)],
              ),
            ),

            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.listview);
              },
              child: Column(
                children: [Text("ir a ListView"), Icon(Icons.list)],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.productListPage);
              },
              child: Column(
                children: [Text("ir a ListView 2.1"), Icon(Icons.list)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
