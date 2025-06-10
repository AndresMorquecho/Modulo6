import 'Taller.dart';

class Vehiculo {
  late String placa;
  late String diagnostico;
  var estado = "Pendiente";
  dynamic extraInfo;

  Vehiculo({required this.placa});

  void registrarDiagnostico(String diagnostico) {
    this.diagnostico = diagnostico;
    Taller.incrementarContador();
    estado = "Reparado";
  }

  void resumen() {
    print(
      "TALLER: ${Taller.nombre} Mensaje: ${Taller.mensajeBienvienida}  VEHICULO: Placa: $placa, Diagnostico: $diagnostico, Estado: $estado, Info: $extraInfo ",
    );
  }
}
