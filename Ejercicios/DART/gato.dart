import 'animal.dart';

class Gato extends Animal {
  @override
  void dormir(){
    print("El gato esta durmiendo");
  }

}

void main(){
  final gato = Gato();
  gato.dormir();
}