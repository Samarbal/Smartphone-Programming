//  multiplication table
import 'dart:io';
void main() {
  print("Enter a number to generate its multiplication table:");
  int number = int.parse(stdin.readLineSync()!);

  print("Multiplication Table of $number:");

  for (int i = 1; i <= 12; i++) {
    int result = number * i;
    print("$number x $i = $result");
  }

}