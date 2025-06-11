void main() {
  // 1. Declara una List<String> llamda comidasFavoritas, que cotenga al menos cinco platos diferentes
  List<String> comidasFavoritas = [
    'Encebollado',
    'Pure de Papa',
    'Pizza',
    'Shawarma',
    'Sopa de pollo',
  ];
  //2. Agrega unan ueva comida al final de la lista utilziando el metodo correspondiente
  comidasFavoritas.add('Ensalada de atún');
  // 2.Elimina una de las comidas existentes
  comidasFavoritas.remove('Sopa de pollo');
  // 4. Imprime la comida en la posicion2
  print(comidasFavoritas[1]);

  //5.Crea una List<List<String>> llamada menuSemanal, donde cada sublista representa un día de la semana
  //con tres comidas: desayuno almuerzo y cena
  List<List<String>> menuSemanal = [
    ['Pan con café', 'Sopa de Queso', 'Puré de Papa'],
    ['Empandas', 'Sopa de Pollo', 'Arroz con menestra'],
    ['Patacones', 'Sopa de Carne', 'Puré de Zanahoria'],
    ['Bolon', 'Seco de pollo', 'Ensalada de atún'],
    ['Pan con café', 'Seco de carne', 'Ensalada de Tomate'],
    ['Tigrillo', 'Sopa de Hueso', 'Puré de Papa'],
    ['Supan', 'Seco de chivo', 'Arroz con carne frita'],
  ];

  // 6 Imprime el almuerzo del día martes
  print(menuSemanal[1][1]);

  // 7 Cambia la cena del viernes por otra comida.

  menuSemanal[4][2] = "Pollo Asado";
  // 8 Recorre el mnu semanal con un bucle y muestra todas las comidas

  for (var comidas in menuSemanal) {
    print(comidas);
  }
}
