// Question 9 : Temperature Converter Fahrenheit to Celsius
import 'dart:io';
void main() {
  stdout.write('Enter the temperature in Fahrenheit: ... ');
  double fahrenheit = double.parse(stdin.readLineSync()!);
  double celsius =5* (fahrenheit - 32) / 9;
  print('The temperature in Celsius is: $celsius');
}