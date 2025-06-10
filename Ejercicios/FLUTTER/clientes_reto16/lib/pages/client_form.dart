import 'package:clientes_reto16/data_base_helper.dart';
import 'package:clientes_reto16/pages/client.dart';
import 'package:flutter/material.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return ClientFormState();
  }
}

class ClientFormState extends State {
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro de Clientes")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text("Nombre"),
                hintText: "Nombres.",
              ),
            ),
            TextField(
              controller: lastnameController,
              decoration: const InputDecoration(
                label: Text("Apellidos"),
                hintText: "Apellidos.",
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text("Correo Electronico"),
                hintText: "Ej: Andres@hotmail.com",
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final newClient = Client(
                  id: DateTime.now().millisecond,
                  name: nameController.text,
                  lastname: lastnameController.text,
                  email: emailController.text,
                );

                DataBaseHelper().insertClient(newClient);
                Navigator.pop(context, true);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cliente Ingresado con exito")),
                );
              },
              child: Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
