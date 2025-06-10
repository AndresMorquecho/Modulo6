import 'package:clientes_reto16/pages/client.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = DataBaseHelper._internal();

  factory DataBaseHelper() => _instance;

  Database? _database;

  DataBaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      return _database = await initDatabase();
    }
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), "client.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE CLIENT(ID INTEGER PRIMARY KEY, NAME TEXT, LASTNAME, EMAIL TEXT)",
        );
      },
    );
  }

  Future<void> insertClient(Client newclient) async {
    final db = await database;
    await db.insert(
      'CLIENT',
      newclient.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Client>> getcliente() async {
    final db = await database;
    final List<Map<String, dynamic>> map = await db.query('CLIENT');

    return List.generate(map.length, (i) {
      return Client(
        id: map[i]["ID"],
        name: map[i]["NAME"],
        lastname: map[i]["LASTNAME"],
        email: map[i]["EMAIL"],
      );
    });
  }

  Future<void> updateClient(Client updateclient) async {
    final db = await database;
    await db.update(
      'CLIENT',
      updateclient.toMap(),
      where: 'id = ?',
      whereArgs: [updateclient.id],
    );
  }

  Future<void> deleteCliente(int id) async {
    final db = await database;
    await db.delete('CLIENT', where: 'id = ?', whereArgs: [id]);
  }
}
