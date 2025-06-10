import 'Taller.dart';
import 'empleado.dart';
import 'vehiculo.dart';

void main() {
  Empleado EmpleadoCarlos = Empleado(nombreEmpleado: "Carlos");

  EmpleadoCarlos.actualizarMensajeDelTaller("Nuevo Mensaje de Bienvenida");

  Vehiculo moto = Vehiculo(placa: "444-222");
  Vehiculo carro = Vehiculo(placa: "777-555");

  moto.registrarDiagnostico("Necesita cambio de aceite");
  moto.extraInfo = "Necesita espejos nuevos cantidad: ";
  moto.extraInfo+= 2.toString();
  moto.resumen();

  carro.registrarDiagnostico("Falta aire en las 4 ruedas");
  carro.extraInfo = "Necesita aire";
  carro.extraInfo = 10;
  carro.resumen();
  Taller.obtenerReparaciones();

}
