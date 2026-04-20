// 1. Write a Dart program that receives two numbers from the user and the operation type is +, -, *, /, or %, and executes the program accordingly. Adhere to the Switch Statement.

import 'dart:io';
void main() {
  print("Enter the first number:");
  double num1 = double.parse(stdin.readLineSync()!);

  print("Enter the second number:");
  double num2 = double.parse(stdin.readLineSync()!);

  print("Enter the operation (+, -, *, /, %):");
  String operation = stdin.readLineSync()!;

  switch (operation) {
    case '+':
      print("Result: ${num1 + num2}");
      break;
    case '-':
      print("Result: ${num1 - num2}");
      break;
    case '*':
      print("Result: ${num1 * num2}");
      break;
    case '/':
      if (num2 != 0) {
        print("Result: ${num1 / num2}");
      } else {
        print("Error: Division by zero is not allowed.");
      }
      break;
    case '%':
      if (num2 != 0) {
        print("Result: ${num1 % num2}");
      } else {
        print("Error: Modulo by zero is not allowed.");
      }
      break;
    default:
      print("Invalid operation. Please enter one of +, -, *, /, or %.");
  }
}