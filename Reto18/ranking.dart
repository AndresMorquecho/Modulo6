void main() {
  //1 Declara un Map<String, int> llamado puntajes donde la clase represneta el nombre y el valor su puntaje
  // 2 Agrega al menos cuatro jugadores con puntajes distintos
  Map<String, int> puntajes = {
    'Julian': 10,
    'Ivan': 8,
    'Andres': 5,
    'Oscar': 4,
  };

  // 3 Muestra todos los nombres de los jugadores registtrados
  print("Nombres de jugadores: ${puntajes.keys}");
  // 4 Imprime el punta de un jugador especifico utizlizado su nombre como clave
  print("Puntaje de Ivan: ${puntajes["Ivan"]}");

  // 5 Modifica el puntaje de uno  de los jugadores:
  print("Puntaje de Andres: ${puntajes["Andres"]}");
  puntajes["Andres"] = 10;
  print("Nuevo Puntaje de Andres: ${puntajes["Andres"]}");
  // 6 Agrega un nuevo jugador con su respectivo puntaje
  puntajes["Selena"] = 7;
  // 7 Elmine a un jugador del mapa
  puntajes.remove("Selena");
  //8 Imprime el contenido completo del mapa actualizado
  print(puntajes);

}
