import 'package:biblioteca/models/book.dart';
import 'package:biblioteca/models/routes.dart';
import 'package:biblioteca/services/database_helper.dart';
import 'package:biblioteca/views/edit_book_page.dart';
import 'package:biblioteca/widgets/book_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State {
  late Future<List<Book>> _bookList;
  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() {
    setState(() {
      _bookList = DatabaseHelper().getbooks();
    });
  }

  void _deletebook(int id) async {
    await DatabaseHelper().deletebook(id);
    _refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mi Biblioteca")),
      body: FutureBuilder<List<Book>>(
        future: _bookList,
        builder: (context, snapshot) {
          if (snapshot.data!.isEmpty || !snapshot.hasData) {
            return const Center(child: Text("No existen Libros que mostrar"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error al cargar la lista de libros ${snapshot.error}",
              ),
            );
          } else {
            return ListView(
              children: snapshot.data!
                  .map(
                    (book) => BookTile(
                      book: book,
                      onDelete: () => _deletebook(book.id),
                      onEdit: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditBookPage(book: book),
                          ),
                        );
                        if (result == true) {
                          _refreshList();
                        }
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
          final result = await Navigator.pushNamed(
            context,
            Routes.addbookroute,
          );
          if (result == true) {
            _refreshList();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
