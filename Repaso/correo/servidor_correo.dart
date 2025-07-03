class ServidorCorreo {
  bool _conectado = false;
  static final ServidorCorreo _instance = ServidorCorreo._internal();

  factory ServidorCorreo() => _instance;
  ServidorCorreo._internal();

  bool get estaConectada => _conectado;

  void conectar() {
    if (_conectado) {
      print("La conexión se encuentra activa");
    } else {
      _conectado = true;
    }
  }

  void enviarCorreo(String destinario, String asunto) {
    if (_conectado) {
      print("Correo ${asunto} enviado a ${destinario} con exito");
    }
  }

  void desconectar() {
    if (_conectado) {
      _conectado = false;
    }
  }
}
