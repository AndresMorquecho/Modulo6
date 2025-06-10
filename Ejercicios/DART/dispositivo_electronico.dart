abstract class DispositivoElectronico {
  int codigo;
  String marca;

  DispositivoElectronico(this.codigo, 
  this.marca);

  void imprimir(){
    print("Soy un dispositivo sin info");
  }

  void registrarInventario();

}