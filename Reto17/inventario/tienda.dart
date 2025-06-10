class Tienda {
  static const nombre = "Tienda No Fio";
  static late String anuncio;
  static int _productosVendido = 0;

  static void cambiarAuncio(String Nuevoanuncio) {
   anuncio = Nuevoanuncio;
  }

  static void aumentarVentas() {
    _productosVendido++;
  }

  static void obtenerVentas() {
    print("Productos vendidos $_productosVendido");
  }
}
