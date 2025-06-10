import 'package:flutter/material.dart';
import 'package:lista_clientes/pages/client.dart';

class ClientList extends StatelessWidget {
  ClientList({super.key});

  final List<Client> clientes =[
    Client(name: "Juanito", lastname: "Perez", email: "JuanitoPerez@hotmail.com"),
    Client(name: "Luis", lastname: "Castillos", email: "Perez@hotmail.com"),
    Client(name: "Manuel", lastname: "Peñafiel", email: "Perez@hotmail.com"),
    Client(name: "Ivan", lastname: "Sanchez", email: "Perez@hotmail.com"),
    Client(name: "Selena", lastname: "Toro", email: "Perez@hotmail.com"),
    Client(name: "Nicole", lastname: "Vaca", email: "Perez@hotmail.com"),
    Client(name: "Andres", lastname: "Pacho", email: "Perez@hotmail.com"),
    Client(name: "Marco", lastname: "Caicedo", email: "Perez@hotmail.com"),
    Client(name: "Emanuel", lastname: "Paez", email: "Perez@hotmail.com"),
    Client(name: "Julian", lastname: "Plata", email: "Perez@hotmail.com"),
    Client(name: "Luciana", lastname: "Castillo", email: "Perez@hotmail.com"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("Lista de Clientes"),
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(clientes[index].name),
            subtitle: Text(clientes[index].lastname),
            leading: Icon(Icons.person_pin),
          );
        },
      ),
    );
  }
}
