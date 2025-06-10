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
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked ,
        floatingActionButton: FloatingActionButton(onPressed: ()=>{
          print("Hello")
        }, child: Icon(Icons.add_a_photo),),
        bottomNavigationBar: BottomNavigationBar( backgroundColor: Colors.green, items: const[
          BottomNavigationBarItem(icon: Icon(Icons.graphic_eq_sharp), label: "Reporte" ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio" ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Conf." ),
   
        ]),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Icon(Icons.sell,color: Colors.lightBlue),
                  Text("Ventas",style:TextStyle(color: Colors.blueGrey, fontSize: 20),),
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_card,color: Colors.lightBlue),                  
                  SizedBox(height: 100),
                  Text("Compras",style:TextStyle(color: Colors.blueGrey, fontSize: 20),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inventory_2_rounded,color: Colors.lightBlue),
                  SizedBox(height: 100),
                  Text("Inventario",style:TextStyle(color: Colors.blueGrey, fontSize: 20),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people,color: Colors.lightBlue),
                  SizedBox(height: 100),
                  Text("Clientes",style:TextStyle(color: Colors.blueGrey, fontSize: 20),),
                ],
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            "APP TEST",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          shadowColor: Colors.pinkAccent,
          elevation: 30,
        ),
        body: Center(child: Text('Hello World!')),
      ),
    );
  }
}
