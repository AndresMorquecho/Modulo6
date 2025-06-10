import 'package:clientes_reto16/data_base_helper.dart';
import 'package:clientes_reto16/pages/client.dart';
import 'package:flutter/material.dart';

class ClientEdit extends StatefulWidget {
  final Client editClient;
  const ClientEdit({super.key, required this.editClient});
  @override
  State<StatefulWidget> createState() {
    return ClientEditState();
  }
}

class ClientEditState extends State<ClientEdit> {
  late TextEditingController nameController;
  late TextEditingController lastnameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.editClient.name);
    lastnameController = TextEditingController(
      text: widget.editClient.lastname,
    );
    emailController = TextEditingController(text: widget.editClient.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edición de Clientes")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
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
              onPressed: () async {
                final editClient = Client(
                  id: widget.editClient.id ,
                  name: nameController.text,
                  lastname: lastnameController.text,
                  email: emailController.text,
                );

                await DataBaseHelper().updateClient(editClient);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cliente Actualizado")),
                );
                Navigator.pop(context, true);
              },
              child: Column(children: [Text("Editar"), Icon(Icons.edit)]),
            ),
          ],
        ),
      ),
    );
  }
}
