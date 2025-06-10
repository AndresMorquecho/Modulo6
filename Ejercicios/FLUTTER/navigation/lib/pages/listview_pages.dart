import 'package:flutter/material.dart';

class ListviewPages extends StatelessWidget {
  const ListviewPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("ListViwe Básico"),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text("Elemento 1"),
            subtitle: Text("Subtitle Elemento 1"),
            leading: Icon(Icons.add_to_queue, color: Colors.amber),
          ),
          ListTile(
            title: Text("Elemento 2"),
            subtitle: Text("Subtitle Elemento 2"),
            leading: Icon(Icons.add_to_queue, color: Colors.amber),
          ),
          ListTile(
            title: Text("Elemento 2"),
            subtitle: Text("Subtitle Elemento 2"),
            leading: Icon(Icons.add_to_queue, color: Colors.amber),
          ),ListTile(
            title: Text("Elemento 3"),
            subtitle: Text("Subtitle Elemento 1"),
            leading: Icon(Icons.add_to_queue, color: Colors.amber,),
          ),ListTile(
            title: Text("Elemento 4"),
            subtitle: Text("Subtitle Elemento 1"),
            leading: Icon(Icons.add_to_queue, color: Colors.amber,),
          )
        ],
      ),
    );
  }
}
