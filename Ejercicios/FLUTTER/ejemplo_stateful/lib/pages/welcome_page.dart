import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return WelcomePageState();
  }
}

class WelcomePageState extends State {
  String? nombre;
  String? apellido;
  String saludo = "";
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Text("Ingrese su nombre:"),
            TextField(onChanged: (text) => {nombre = text}),
            const Text("Ingrese su apellido:"),
            TextField(onChanged: (value) => {apellido = value}),
            MaterialButton(
              color: Colors.amber,
              onPressed: () => {
                saludo = "Bienvenido: ${nombre!} ${apellido!}",

                setState(() {}),
              },
              child: Text(
                "Saludar",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
            Text(saludo),
          ],
        ),
      ),
    );
  }
}
