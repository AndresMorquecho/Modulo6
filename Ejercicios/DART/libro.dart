class Libro {
  String ISBN;
  String Titulo;
  int? numeroPaginas;
  String? descripcion;

  Libro(this.ISBN, this.Titulo, this.numeroPaginas, this.descripcion);

  String imprimirLibro(){
    return ("ISBN: $ISBN Titulo: $Titulo Numero de Paginas: $numeroPaginas Descripción: $descripcion");
  }

}

  void main(){

    Libro libro1 = Libro("1234567890", "Harry Potter", null, null);
    Libro libro2 = Libro("0987654321", "El señor de los anillos", null, "La novela narra el viaje del protagonista principal, Frodo Bolsón, hobbit de la Comarca");

    print(libro1.imprimirLibro());
    print(libro2.imprimirLibro());


  }