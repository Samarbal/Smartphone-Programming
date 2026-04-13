// Question 11: Summing teh digits of a number 0 and 1000
import 'dart:io';
void main() {
  stdout.write('Enter a number between 0 and 1000: ... ');
  int number = int.parse(stdin.readLineSync()!);

  if (number < 0 || number > 1000) {
    print('Please enter a valid number between 0 and 1000.');
    return;}
  print("------------------------------");

  int sum = 0;
  int originalNumber = number;
  print('The process of summing the digits of $number:');
  while (originalNumber > 0) {
    // add the last digit to the sum
    sum += originalNumber % 10;
    // remove the last digit
    originalNumber ~/= 10;
    print('Current sum: $sum, Remaining number: $originalNumber');  }

  print('The sum of the digits of $number is: $sum');
}
