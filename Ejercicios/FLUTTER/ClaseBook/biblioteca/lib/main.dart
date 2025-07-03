import 'package:biblioteca/models/routes.dart';
import 'package:biblioteca/views/add_book_page.dart';
import 'package:biblioteca/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca Demo',
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.red ),
      routes: {Routes.addbookroute: (ctx) => AddBookPage()},
    );
  }
}
