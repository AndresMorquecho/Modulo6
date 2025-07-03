import 'package:flutter/material.dart';
import 'package:gestion_tareas/models/tarea.dart';
import 'package:gestion_tareas/services/database_helpert.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<StatefulWidget> createState() => AddTaskPageState();
}

class AddTaskPageState extends State<AddTaskPage> {
  final tituloController = TextEditingController();
  final descripcionController = TextEditingController();
  final fechaVencimientoController = TextEditingController();
  String estado = "Pendiente";
  final _formKey = GlobalKey<FormState>();

  void insertTask() async {
    if (_formKey.currentState!.validate()) {
      final tarea = Tarea(
        id: DateTime.now().millisecond,
        titulo: tituloController.text,
        descripcion: descripcionController.text,
        fechaVencimiento: fechaVencimientoController.text,
        estado: estado,
      );

      await DatabaseHelper().insertTarea(tarea);
      Navigator.pop(context, true);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Nueva tarea agregada con exito")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, corrige los errores del formulario.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrar Tareas")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: tituloController,
                decoration: const InputDecoration(
                  labelText: "Titulo:",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusColor: Colors.black,
                  hoverColor: Colors.amber,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Debe especificar el Titulo";
                  } else {
                    return null;
                  }
                },
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: descripcionController,
                decoration: InputDecoration(
                  labelText: "Descripcion:",
                  focusColor: Colors.black,
                  hoverColor: Colors.amber,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignLabelWithHint: true,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: fechaVencimientoController,
                decoration: InputDecoration(
                  labelText: "Fecha de Vencimiento:",
                  focusColor: Colors.black,
                  hoverColor: Colors.amber,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                keyboardType: TextInputType.datetime,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Debe especificar la fecha de vencimiento de la Tarea";
                  } else {
                    try {
                      DateFormat('yyyy-MM-dd').parseStrict(value);
                      return null;
                    } catch (e) {
                      return 'Fecha invalida, por favor usar: YYYY-MM-DD';
                    }
                  }
                },
              ),
              SizedBox(height: 20),

              DropdownButton(
                borderRadius: const BorderRadius.all(Radius.circular(20)),

                value: estado,
                items: ['Pendiente', 'Completado']
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    estado = value!;
                  });
                },
                icon: Icon(
                  Icons.arrow_drop_down_circle,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  insertTask();
                },
                child: Text("Guardar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
