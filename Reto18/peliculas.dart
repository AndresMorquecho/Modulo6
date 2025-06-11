//1 Crea una clase pelicula con dos atributos: Srting titulo, int anioEstreno

class Pelicula {
  String? titulo;
  int? anioEstreno;
  Pelicula(this.titulo, this.anioEstreno);
}

// 2 Declara un Map llamado catalogoStreaming
// 3 Agrega al menos dos peliculas cada plataforma
void main() {
  Map<String, List<Pelicula>> catalogoStreaming = {
    'Netflix': [
      Pelicula("Casa de Papel", 2015),
      Pelicula("Juego del Calamar", 2018),
    ],
    'HBO': [
      Pelicula("Juego de Tronos", 2015),
      Pelicula("The Last of Us", 2018),
    ],
    'Disney+': [Pelicula("Avengers", 2015), Pelicula("Star Wars", 2018)],
  };

  // 4 Imprime los titulos de todas las peliduclas disponibles en Netflix
  print("Peliculas disponibles en Netflix:");
  for (var peliculas in catalogoStreaming["Netflix"]!) {
    print(peliculas.titulo);
  }

  // 5 Agrega una peliducla nueva a la plataforma Disney+

  catalogoStreaming["Disney+"]!.add(Pelicula("Toy Story", 2002));

  // 6 Cambia el año de estreno de una de las peliduclas en HBO
  catalogoStreaming["HBO"]![1].anioEstreno = 1999;

  // 7 Elimina una pelicula de Netflix
  catalogoStreaming["Netflix"]!.removeAt(0);

  // 8 Recorre todo el mapa y muestra el nombre de cada plataforma
  catalogoStreaming.forEach((plataforma, listaPeliculas) {
    print("Películas en $plataforma:");
    for (var peli in listaPeliculas) {
      print(" - ${peli.titulo} (${peli.anioEstreno})");
    }
  });
}
