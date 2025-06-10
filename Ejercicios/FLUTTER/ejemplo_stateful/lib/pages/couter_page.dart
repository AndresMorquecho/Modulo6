import 'package:flutter/material.dart';

class CouterPages extends StatefulWidget {
  const CouterPages({super.key});

  @override
  State<StatefulWidget> createState() {
    return CounterPageState();
  }
}

class CounterPageState extends State {

  int counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        counter +=1;
        print("$counter");
        setState(()=> {});
      }, child: Column(children: [Icon(Icons.add_home), Text("Hola")],) ,),
      appBar: AppBar(backgroundColor: Colors.white),
      body:  Center(child:  Text("$counter", style: TextStyle(fontSize: 50),)),
    );
  }
}
