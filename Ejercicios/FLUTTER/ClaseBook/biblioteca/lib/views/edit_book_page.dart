import 'package:biblioteca/models/book.dart';
import 'package:biblioteca/services/database_helper.dart';
import 'package:flutter/material.dart';

class EditBookPage extends StatefulWidget {
  final Book book;
  const EditBookPage({required this.book, super.key});
  @override
  State<StatefulWidget> createState() => EditBookPageStatus();
}

class EditBookPageStatus extends State<EditBookPage> {
  late TextEditingController titleController;
  late TextEditingController authorController;
  late TextEditingController statusController;
  late TextEditingController notesController;
  String? status;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.book.title);
    authorController = TextEditingController(text: widget.book.author);
    status = widget.book.status;
    notesController = TextEditingController(text: widget.book.notes);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agregar libro")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: authorController,
              decoration: InputDecoration(labelText: 'Autor'),
            ),
            DropdownButton<String>(
              value: status,
              items: [
                'Leído',
                'Pendiente',
              ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
              onChanged: (val) => {
                setState(() {
                  status = val!;
                }),
              },
            ),
            TextField(
              controller: notesController,
              decoration: InputDecoration(labelText: 'Notas'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final book = Book(
                  id: widget.book.id,
                  title: titleController.text,
                  author: authorController.text,
                  status: status!,
                  notes: notesController.text,
                );
                await DatabaseHelper().updatebook(book);
                Navigator.pop(context, true);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Registro editado con exito")),
                );
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
