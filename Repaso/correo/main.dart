import 'servidor_correo.dart';

void main() {
  final correo = ServidorCorreo();
  final correo2 = ServidorCorreo();

  correo.conectar();
  correo.enviarCorreo("Juan", "Presentacion.ptt");
  correo2.enviarCorreo("Luis", "Archivo.pdf");
  if (correo2 == correo) {
    print("La instancia es la misma");
  }

  print("Estado del servidor ${correo2.estaConectada}");

  correo.desconectar();
  print("Estado del servidor ${correo2.estaConectada}");
}
