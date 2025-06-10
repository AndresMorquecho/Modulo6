import 'package:flutter/material.dart';
import 'package:lista_clientes/pages/routes.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), backgroundColor: Colors.amber),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.clientlist );
          },
          child: Column(
            children: [
              Text("Lista de Clientes", style: TextStyle(fontSize: 20 ),),
              Icon(Icons.format_list_numbered_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
