import 'package:biblioteca/models/book.dart';
import 'package:biblioteca/models/routes.dart';
import 'package:biblioteca/services/database_helper.dart';
import 'package:biblioteca/views/edit_book_page.dart';
import 'package:flutter/material.dart';

class ListBookPage extends StatefulWidget {
  const ListBookPage({super.key});

  @override
  State<StatefulWidget> createState() => ListBookPageState();
}

class ListBookPageState extends State<ListBookPage> {
  late Future<List<Book>> books;

  @override
  void initState() {
    super.initState();
    loadbooks();
  }

  void loadbooks() {
    setState(() {
      books = DatabaseHelper().getbooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de libros")),
      body: FutureBuilder(
        future: books,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No hay datos que mostrar"));
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error al mostrar los datos ${snapshot.error}"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, i) {
                final book = snapshot.data![i];

                return ListTile(
                  title: Text("Titulo: ${book.title}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Autor: ${book.author}"),
                      Text("Notas: ${book.notes}"),
                    ],
                  ),
                  leading: Text("Estado: ${book.status}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) {
                                return EditBookPage(book: book);
                              },
                            ),
                          );

                          if (result == true) {
                            loadbooks();
                          }
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          await DatabaseHelper().deletebook(book.id);
                          loadbooks();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Libro eliminado con exito"),
                            ),
                          );
                        },
                        icon: Icon(Icons.delete),
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
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            Routes.addbookroute,
          );

          if (result == true) {
            loadbooks();
          }
        },
        child: Icon(Icons.add))
    );
  }
}
