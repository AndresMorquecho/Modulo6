import 'Taller.dart';

class Empleado {
  late String nombreEmpleado;

  Empleado({required this.nombreEmpleado});

  void actualizarMensajeDelTaller(String new_message) {
    Taller.CambiarMensaje(new_message);
  }
}
