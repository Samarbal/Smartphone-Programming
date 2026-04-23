import 'dart:io';

void main() {
  int positiveCount = 0;
  double sum = 0;
  int invalidCount = 0; 
  int totalAttempts = 0; 
  print("Enter 10 positive numbers (only > 0):");

  while (positiveCount < 10) {
    totalAttempts++; 
    double? number = double.tryParse(stdin.readLineSync()!);
    if (number == null) {
      print("Invalid input. Please enter a number.");
      invalidCount++;
      continue;
    }
    if (number <= 0) {
      print("Number must be positive.");
      invalidCount++;
      continue;
    }
    sum += number;
    positiveCount++;
  }

  print("----------------------------------------------------");
  print("--- final results ---");
  print("Sum: ${sum.toStringAsFixed(2)}");
  print("Total attempts: $totalAttempts");
  print("Invalid attempts: $invalidCount");
}