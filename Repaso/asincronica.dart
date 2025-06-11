void main() {
  print("Operacion 1");
  Future.delayed(Duration(seconds: 3), () => {print("Operacion 2 asincrona")});
  print("Operacion 3");
  print("Operacion 4");

  print("Estoy en mi casa");
  pedirPizza();
  print("Viendo la televicion");
}

Future<String> prepararPizza() {
  return Future.delayed(Duration(seconds: 5), () => "Pizza entregada");
}

void pedirPizza() async {
  print("Llamando al a pizzeria");

  final mesaje = await prepararPizza();

  print(mesaje);
  print("A comer la pizza");
}
