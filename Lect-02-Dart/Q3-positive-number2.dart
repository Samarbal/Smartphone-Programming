import 'dart:io';

void main() {
  int positiveCount = 0;
  double sum = 0;
  int invalidCount = 0; 
  int totalAttempts = 0; 

  print("Enter 10 positive numbers:");

  while (positiveCount < 10) {
    totalAttempts++; 
    double number = double.parse(stdin.readLineSync()!);
    if (number > 0) {
      sum += number;
      positiveCount++;
    } else {
      invalidCount++;
      print("Please enter a positive number. Try again.");
    }
  }

  print("----------------------------------------------------");
  print("--- final results ---");
  print("The sum of 10 positive numbers is: $sum");
  print("Total attempts: $totalAttempts");
  print("Invalid attempts: $invalidCount");
}
