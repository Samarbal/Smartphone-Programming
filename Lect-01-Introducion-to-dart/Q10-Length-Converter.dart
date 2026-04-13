// Question 10 : length convertor ( inch to meter)
import 'dart:io';
void main() {
  stdout.write('Enter the length in inches: ... ');
  double inch = double.parse(stdin.readLineSync()!);
  double meter = inch * 0.0254;
  print('The length in meters is: $meter');
}