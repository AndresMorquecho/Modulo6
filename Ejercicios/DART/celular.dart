import 'dispositivo_electronico.dart';

class Celular extends DispositivoElectronico {

  Celular(super.codigo, super.marca);

  void imprimir(){
    print('Codigo $codigo, Marca: $marca');
  }

  void registrarInventario(){
    print('Registrando Inventario. Codigo: $codigo, Marca: $marca');

  }

}

void main(){
  final cell = Celular(2,"Samsung");
  cell.imprimir();
}