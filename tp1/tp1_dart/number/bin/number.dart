import 'package:number/number.dart' as number;

void main(List<String> arguments) {
  int price1 = 122;
  double sum = 0;
  double price2 = 455.21;
  final strSeven = "7";
  final numSeven = int.parse(strSeven);
  print('$price1 $price2');
  sum = number.calculate(price1,price2);
  print(sum);
  print(sum.runtimeType);
  print(sum.toInt());
  print(numSeven);
}