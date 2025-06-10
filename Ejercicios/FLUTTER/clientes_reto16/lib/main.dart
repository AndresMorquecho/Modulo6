import 'package:clientes_reto16/pages/client_form.dart';
import 'package:clientes_reto16/pages/client_list.dart';
import 'package:clientes_reto16/pages/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClientList(),
      routes: {
        Routes.clientForm: (ctx) => ClientForm(),
      },
    );
  }
}
