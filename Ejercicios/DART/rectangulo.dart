class Rectangulo {
  int base = 0;
  int altura = 0;

  Rectangulo(this.base, this.altura);
  int CalcularArea() {
    return base * altura;
  }
  int CalcularPerimetro() {
    return 2 * base + 2 * altura;
  }
}

void main() {
  final r1 = Rectangulo(10, 5);
  final r2 = Rectangulo(8, 2);

  int area1 = r1.CalcularArea();
  int area2 = r2.CalcularArea();
  int perimetro1 = r1.CalcularPerimetro();
  int perimetro2 = r2.CalcularPerimetro();

  print("Area 1: ${area1}");
  print("Area 2: ${area2}");
  print("Perimetro 1: ${perimetro1}");
  print("Perimetro 2: ${perimetro2}");
}
