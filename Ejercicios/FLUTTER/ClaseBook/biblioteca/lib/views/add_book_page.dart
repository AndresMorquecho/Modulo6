import 'package:biblioteca/models/book.dart';
import 'package:biblioteca/services/database_helper.dart';
import 'package:flutter/material.dart';
class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return AddBookPageState();
  }
}
class AddBookPageState extends State<AddBookPage> {
  final titlecontroller = TextEditingController();
  final authorcontroller = TextEditingController();
  final notescontroller = TextEditingController();
  String status = 'Pendiente';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agregar libro")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titlecontroller,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: authorcontroller,
              decoration: InputDecoration(labelText: 'Autor'),
            ),

            DropdownButton<String>(
              value: status,
              items: [
                "Leído",'Pendiente',
              ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
              onChanged: (val) => {
                setState(() {
                  status = val!;
                }),
              },
            ),
            TextField(
              controller: notescontroller,
              decoration: InputDecoration(labelText: 'Notas'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final book = Book(
                  id: DateTime.now().millisecond,
                  title: titlecontroller.text,
                  author: authorcontroller.text,
                  status: status,
                  notes: notescontroller.text,
                );

                await DatabaseHelper().insertbook(book);
                Navigator.pop(context, true);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Registro creado con exito")),
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
