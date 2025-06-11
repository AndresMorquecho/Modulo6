void main()  {
  print("Sigo receta para preparar Pure");
  print("Pelo Papas");
  print("Las pongo a hervir");
  FrioCarne();
}

Future<String> HervirPapas() async {
  print("Papas hirviendo.....");
  return Future.delayed(
    Duration(seconds: 2),
    () => "Las Papas ya estan hervidas",
  );
}

void FrioCarne()async{
  print("Sigo Friendo la carne");
  final papas = await HervirPapas();
  print(papas);
  print("Majo las papas");
}