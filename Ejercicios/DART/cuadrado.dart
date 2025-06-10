import 'figura.dart';

class Cuadrado extends Figura {

  final double lado;
  const Cuadrado(this.lado, super.color);

  @override
  double calcularArea(){
    return lado * lado;
  }  

  @override
  double calcularPerimetro(){
    return 4 * lado;
  }
}

void main(){
   final cua = const Cuadrado(10,"Rojo");
   final area1 = cua.calcularArea();
   final perimetro = cua.calcularPerimetro();

  print("area $area1 perimetro $perimetro");

}