import 'package:gestion_tareas/models/tarea.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      return _database = await initDatabase();
    }
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'task.db');
    return openDatabase(
      version: 1,
      path,
      onCreate: (db, version) async {
        return await db.execute(
          'create table task(id integer primary key, titulo text, descripcion text, fechaVencimiento text, estado text )',
        );
      },
    );
  }

  Future<void> insertTarea(Tarea tarea) async {
    final db = await database;
    db.insert(
      'task',
      tarea.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Tarea>> getTareas() async {
    final db = await database;
    final List<Map<String, dynamic>> map = await db.query('task');
    return List.generate(map.length, (i) {
      return Tarea(
        id: map[i]['id'],
        titulo: map[i]['titulo'],
        descripcion: map[i]['descripcion'],
        fechaVencimiento: map[i]['fechaVencimiento'],
        estado: map[i]['estado'],
      );
    });
  }

  Future<void> updateTarea(Tarea tarea) async {
    final db = await database;
    db.update(
      'task',
      tarea.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
      where: 'id = ?',
      whereArgs: [tarea.id],
    );
  }

  Future<void> deleteTarea(int idtarea) async {
    final db = await database;
    db.delete('task', where: 'id = ?', whereArgs: [idtarea]);
  }
}
