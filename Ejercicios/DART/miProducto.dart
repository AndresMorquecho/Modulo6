class Miproducto {
  String codigo;
  double precio;
  String? descripcion;

  Miproducto(this.codigo, this.precio, this.descripcion);
  Miproducto.generico(this.codigo, this.descripcion):precio = 0.0;

  String imprimir(){
    return ("Codigo $codigo Precio $precio Descripcion $descripcion");
  }

}

void main(){

  Miproducto p1 = Miproducto("0001", 23, "Laptop");
  Miproducto p2 = Miproducto.generico("0002","Mouse Gamer");

  print(p1.imprimir());
  print(p2.imprimir());

}