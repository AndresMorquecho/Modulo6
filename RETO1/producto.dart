class Producto{
  String codigo = "";
  String nombre = "";
  String? descripcion;
  bool activo=true;
  double precio = 0.0;
  int? stock;

}

void main(){

  //Usar new y usar el tipo de dato Producto
  Producto p1 = new Producto();
  p1.codigo = "COD001";
  p1.nombre = "Laptop Gamer";
  p1.descripcion = "Procesador Ryzen 7, 1TB SSD, 32GB RAM";
  p1.precio = 1500;
  p1.stock = 5;

  print("Codigo: ${p1.codigo} Nombre: ${p1.nombre} Descripcion: ${p1.descripcion} Precio: ${p1.precio} Activo: ${p1.activo} Stock: ${p1.stock}");
  
  //NO Usar new y usar el tipo de dato Producto
  Producto p2 = Producto();
  p2.codigo = "COD002";
  p2.nombre = "Cocina";
  p2.descripcion = "Cocina a gas";
  p2.precio  = 200;
  p2.stock = 0;
  p2.activo = false;

  print("Codigo: ${p2.codigo} Nombre: ${p2.nombre} Descripcion: ${p2.descripcion} Precio: ${p2.precio} Activo: ${p2.activo} Stock: ${p2.stock}");

  //NO Usar new y usar el modificador final
  final p3 = Producto();
  p3.codigo = "COD003";
  p3.nombre = "Ventilador";
  p3.precio  = 20;
  p3.stock = 0;
  p3.activo = false; 
    
  print("Codigo: ${p3.codigo} Nombre: ${p3.nombre} Descripcion: ${p3.descripcion} Precio: ${p3.precio} Activo: ${p3.activo} Stock: ${p3.stock}");


}