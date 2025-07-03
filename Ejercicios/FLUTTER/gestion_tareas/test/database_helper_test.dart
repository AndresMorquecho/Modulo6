import 'package:gestion_tareas/models/tarea.dart';
import 'package:gestion_tareas/services/database_helpert.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;
  late DatabaseHelper databaseHelper;

  setUp(() async {
    databaseHelper = DatabaseHelper();
  });

  test('insert', () async {
    final tarea = Tarea(
      id: 1,
      titulo: "titulo",
      descripcion: "descripcion",
      fechaVencimiento: "fechaVencimiento",
      estado: "estado",
    );

    await databaseHelper.insertTarea(tarea);

    var alltareas = await databaseHelper.getTareas();

    for (var tareas in alltareas) {
      print(" Titulo: ${tareas.titulo}");
    }
  });

  test('update', () async {
    final tarea = Tarea(
      id: 1,
      titulo: "tituloUpdate",
      descripcion: "descripcionUpdate",
      fechaVencimiento: "fechaVencimientoUpdate",
      estado: "estadoUpdate",
    );

    await databaseHelper.updateTarea(tarea);

    var alltareas = await databaseHelper.getTareas();

    for (var tareas in alltareas) {
      print(" Titulo: ${tareas.titulo}");
    }
  });

  test('delete', () async {
    await databaseHelper.deleteTarea(1);

    var alltareas = await databaseHelper.getTareas();

    for (var tareas in alltareas) {
      print(" Titulo: ${tareas.titulo}");
    }
  });
}
