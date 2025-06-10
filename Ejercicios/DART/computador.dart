import 'celular.dart';
import 'dispositivo_electronico.dart';

class Computador extends DispositivoElectronico{
  int capacidadDisco;

  Computador(super.codigo, super.marca, this.capacidadDisco);

  void imprimir(){
    print("Codigo $codigo, Marca $marca, Capacidad Disco $capacidadDisco");
  }  


  void registrarInventario(){
    print('Registrando Inventario. Codigo: $codigo, Marca: $marca');

  }
}

  void main(){
    final computadora = Computador(1,"Dell",16);
    computadora.registrarInventario();

    final cell = Celular(2, "Iphone");
    cell.registrarInventario();

  }