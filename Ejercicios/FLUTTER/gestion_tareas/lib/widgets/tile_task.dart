import 'package:flutter/material.dart';
import 'package:gestion_tareas/models/tarea.dart';

class TileTask extends StatelessWidget {
  final Tarea tarea;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TileTask({
    super.key,
    required this.tarea,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    Color colorstatus;

    switch (tarea.estado.toLowerCase()) {
      case 'pendiente':
        colorstatus = Colors.orange;
        break;
      case 'completado':
        colorstatus = Colors.lightBlue;
        break;
      default:
        colorstatus = Colors.blueGrey;
    }

    return Card(
      elevation: 9.0,
      margin: EdgeInsets.all(20),
      child: ListTile(
        title: Text(tarea.titulo),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Descripcion: ${tarea.descripcion}"),
            SizedBox(height: 10),
            Text("Fecha de Vencimiento: ${tarea.fechaVencimiento}"),
            SizedBox(height: 10),
            Divider(thickness: 1),
           
            Chip(label: Text(tarea.estado), backgroundColor: colorstatus),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onEdit, icon: Icon(Icons.edit_note, color: Colors.blueGrey,)),
            IconButton(onPressed: onDelete, icon: Icon(Icons.delete_outline, color: Colors.redAccent,)),
          ],
        ),
      ),
    );
  }
}
