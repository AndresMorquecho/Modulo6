
import 'package:biblioteca/models/book.dart';
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
      return _database = await initDabase();
    }
  }

  Future<Database> initDabase() async {
    String path = join(await getDatabasesPath(), 'book.bd');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute(
          'create table book(id integer primary key, title text, author text, status text, notes text )',
        );
      },
    );
  }

  Future<void> insertbook(Book book) async {
    final db = await database;
    await db.insert(
      'book',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Book>> getbooks() async {
    final db = await database;
    List<Map<String, dynamic>> map = await db.query('book');
    return List.generate(map.length, (i) {
      return Book(
        id: map[i]['id'],
        title: map[i]['title'],
        author: map[i]['author'],
        status: map[i]['status'],
        notes: map[i]['notes'],
      );
    });
  }

  Future<void> updatebook(Book book) async {
    final db = await database;
    await db.update(
      'book',
      book.toMap(),
      where: 'id = ?',
      whereArgs: [book.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deletebook(int id) async {
    final db = await database;
    await db.delete('book', where: 'id = ?', whereArgs: [id]);
  }
}
