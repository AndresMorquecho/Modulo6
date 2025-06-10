import 'package:flutter/material.dart';
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return CalculatorPageState();
  }
}
class CalculatorPageState extends State {
  int valor1 = 0;
  int valor2 = 0;
  int resultado = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculadora", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF264653),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ingrese un numero", style: TextStyle(fontSize: 20)),
            TextField(
              controller: TextEditingController(text: "0"),
              onChanged: (value) => {valor1 = int.parse(value)},
              textAlign: TextAlign.right,
              keyboardType: TextInputType.number,
            ),
            Text("Ingrese un numero", style: TextStyle(fontSize: 20)),
            TextField(
              controller: TextEditingController(text: "0"),
              onChanged: (value) => {valor2 = int.parse(value)},
              textAlign: TextAlign.right,
              keyboardType: TextInputType.number,
            ),
            MaterialButton(
              onPressed: () => {
                resultado = valor1 + valor2,

                setState(() => {}),
              },
              color: Color(0xff2a9d8f),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calculate_outlined, color: Colors.white),
                  Text(
                    "Sumar",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text("Resultado: ", style: TextStyle(fontSize: 20)),
                Text("$resultado", style: TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
