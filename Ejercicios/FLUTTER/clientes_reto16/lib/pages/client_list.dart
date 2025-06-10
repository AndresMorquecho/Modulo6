import 'package:clientes_reto16/data_base_helper.dart';
import 'package:clientes_reto16/pages/client.dart';
import 'package:clientes_reto16/pages/client_edit.dart';
import 'package:clientes_reto16/pages/routes.dart';
import 'package:flutter/material.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<StatefulWidget> createState() {
    return ClientListState();
  }
}

class ClientListState extends State {
  late Future<List<Client>> _allclients;

  @override
  void initState() {
    super.initState();
    _loadClient();
  }

  void _loadClient() {
    setState(() {
      _allclients = DataBaseHelper().getcliente();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Clientes")),
      body: FutureBuilder<List<Client>>(
        future: _allclients,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Eror al conectarse a la base de datos: ${snapshot.error}",
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No hay Clientes que mostrar"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, index) {
                final client = snapshot.data![index];
                return ListTile(
                  title: Text("Nombres: ${client.name}"),
                  leading: Icon(Icons.person_sharp, color: Colors.blueAccent),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Apellidos: ${client.lastname}"),
                      Text("Correo: ${client.email}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => ClientEdit(editClient: client),
                            ),
                          );
                          if (result == true) {
                            _loadClient();
                          }
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          await DataBaseHelper().deleteCliente(client.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Cliente eliminado cone exito"),
                            ),
                          );
                          _loadClient();
                        },
                        icon: Icon(Icons.delete_forever, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: () async {
          final result = await Navigator.pushNamed(context, Routes.clientForm);
          if (result == true) {
            _loadClient();
          }
        },
      ),
    );
  }
}
