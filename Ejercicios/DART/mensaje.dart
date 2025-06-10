class Mensaje {

  void saludar(String nombre, String apellido, String? apodo){
    print('Hola $nombre, $apellido, $apodo');
  }

  void despedirse({String? nombre, String? apellido, String? apodo}){
    print('Hola $nombre, $apellido, $apodo');
  
  }

    void animar({required String nombre, String? apellido, String? apodo}){
    print('Hola $nombre, $apellido, $apodo');
  
  }
}

void main(){
  final msg = Mensaje();
  msg.saludar("Juan", "Perez", null);

  msg.despedirse(apodo: "Crack");
  msg.despedirse(apodo: "Crack", nombre: "Juannito");
  msg.animar(nombre: "Andres");

}