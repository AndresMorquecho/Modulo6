import 'package:flutter/material.dart';
import 'package:gestion_tareas/models/routes.dart';
import 'package:gestion_tareas/models/tarea.dart';
import 'package:gestion_tareas/services/database_helpert.dart';
import 'package:gestion_tareas/views/edit_task_page.dart';
import 'package:gestion_tareas/widgets/tile_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => HomePageState();
}
class HomePageState extends State {
  late Future<List<Tarea>> tareas;
  @override
  void initState() {
    super.initState();
    _refreshList();
  }
  void _refreshList() {
    setState(() {
      tareas = DatabaseHelper().getTareas();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tareas")),
      body: FutureBuilder(
        future: tareas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.isEmpty || !snapshot.hasData) {
            return const Center(child: Text("No existen tareas que mostrar"));
          } else {
            final tarea = snapshot.data!;
            return ListView(
              children: tarea
                  .map(
                    (tarea) => TileTask(
                      tarea: tarea,
                      onEdit: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditTaskPage(tarea: tarea),
                          ),
                        );

                        if (result == true) {
                          _refreshList();
                        }
                      },
                      onDelete: () async {
                        await DatabaseHelper().deleteTarea(tarea.id);
                        _refreshList();
                      },
                    ),
                  )
                  .toList(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, Routes.addPage);
          if (result == true) {
            _refreshList();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
