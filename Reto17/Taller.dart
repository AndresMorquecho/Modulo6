class Taller {
  static final nombre = "Taller Peñafiel";
  static String mensajeBienvienida = "Bienvienidos a taller Peñafiel";
  static int totalReparaciones = 0;

  static CambiarMensaje (String new_message) {
    mensajeBienvienida = new_message;
  }

  static void incrementarContador() {
    totalReparaciones++;
  }

  static void obtenerReparaciones() {
    print({"Número de reparaciónes: $totalReparaciones"});
  }
}
