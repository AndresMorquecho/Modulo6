import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
        floatingActionButton:FloatingActionButton(onPressed: ()=>{
          print("Hola")
        },
        child: Icon(Icons.delete),
        ) ,
        drawer: const Drawer(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text("Opcción1"),
              Text("Opcción2"),
              Text("Opcción2"),
              Text("Opcción2"),
              Text("Opcción2"),
              Text("Opcción2"),
              Text("Opcción3")
            ],
          ),
        ),
        body: const Center(
          child: Text("Widget!"),
        ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: const Text("Selenosa la más Hermosa <3")),
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black)
      ),
      backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
