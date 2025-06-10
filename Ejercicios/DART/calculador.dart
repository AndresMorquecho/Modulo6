class Calculadora{
  int sumar(int valor1, int valor2){
    return valor1 + valor2;
  }
}


void main(){
  final calc = Calculadora();
   int resultado = calc.sumar(10,8);
    print(  "El resultado es: ${resultado}");
}