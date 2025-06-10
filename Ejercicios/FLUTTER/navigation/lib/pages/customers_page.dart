import 'package:flutter/material.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar:  AppBar(backgroundColor: Colors.cyan,
         title: Text("Clientes"),),
        body: Center(child: Text("Página clientes"),),
        
      );
  }
  
}