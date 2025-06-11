void main(){
  Map<String,int> poblacion = {
    'Quito': 200,
    'Guayaqui':500,
    'Milagro': 600
  };

  print(poblacion);
  print(poblacion.keys);
  print(poblacion.values);
  print(poblacion['Milagro']);
  print(poblacion.containsKey('Ambato'));

  poblacion['Loja'] = 4999;
  print(poblacion);

  poblacion.remove('Loja');
  print(poblacion);

  Map <String, List<String>> regiones = {
    'Sierra': ['Quito', 'Cuenca', 'Ambato'],
    'Costa': ['Guayaquil', 'Milagro', 'Daule'],
    'Oriente': ['Tena', 'Puyo'],
  };

  print(regiones['Sierra']);
  print(regiones['Sierra']![1]);

}