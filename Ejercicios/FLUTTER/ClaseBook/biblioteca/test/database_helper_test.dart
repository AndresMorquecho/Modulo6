import 'package:biblioteca/models/book.dart';
import 'package:biblioteca/services/database_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;
  late DatabaseHelper databaseHelper;

  setUp(() {
    databaseHelper = DatabaseHelper();
  });

  test('create', () async {
    final book = Book(
      id: 1,
      title: "title",
      author: "author",
      status: "status",
      notes: "notes",
    );

    await databaseHelper.insertbook(book);

    var allbooks = await databaseHelper.getbooks();

    for (var books in allbooks) {
      print(
        "ID ${books.id}, Tittle: ${books.title}, Author: ${books.author}, Status: ${books.status}, Notes: ${books.notes} ",
      );
    }
  });

  test('update', () async {
    final book = Book(
      id: 1,
      title: "titleUpdate",
      author: "authorUpdate",
      status: "statusUpdate",
      notes: "notesUpdate",
    );

    await databaseHelper.updatebook(book);

    var allbooks = await databaseHelper.getbooks();

    for (var books in allbooks) {
      print(
        "ID ${books.id}, Tittle: ${books.title}, Author: ${books.author}, Status: ${books.status}, Notes: ${books.notes} ",
      );
    }
  });

  test('delete', () async {
    await databaseHelper.deletebook(1);

    var allbooks = await databaseHelper.getbooks();

    for (var books in allbooks) {
      print(
        "ID ${books.id}, Tittle: ${books.title}, Author: ${books.author}, Status: ${books.status}, Notes: ${books.notes} ",
      );
    }
  });
}
