import 'tienda.dart';

class Producto {
  late int codigo;
  late String descripcion;
  var precio;
  dynamic observacion;

  Producto({required this.codigo});

  void registrarVenta(String descripcion, var precio, dynamic observacion) {
    this.precio = precio;
    this.descripcion = descripcion;
    this.observacion = observacion;

    Tienda.aumentarVentas();
  }

  void resumen() {
    print(
      "PRODUCTO: Codigo: $codigo, Descripción: $descripcion, Precio $precio, Observaciones: $observacion TIENDA: Nombre: ${Tienda.nombre} Anuncio: ${Tienda.anuncio} ",
    );
  }

}
  void main() {
    final Producto p1 = Producto(codigo: 1);
    final Producto p2 = Producto(codigo: 1);

    p1.registrarVenta("1 Libra de Tomate", 2, "Para hacer ensalda de Atún");
    p2.registrarVenta("1 Libra de Cebolla", 2, "Para hacer encebollado");

    Tienda.cambiarAuncio("Hoy no fío, mañana si");
    p1.resumen();
    p2.resumen();

    Tienda.obtenerVentas();

  }
