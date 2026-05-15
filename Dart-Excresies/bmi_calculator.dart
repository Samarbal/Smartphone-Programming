import 'dart:io';

void main() {
  // Get user input for weight
  print('Enter your weight in kilograms:');
  double weight = double.parse(stdin.readLineSync()!);

  // Get user input for height
  print('Enter your height in meters:');
  double height = double.parse(stdin.readLineSync()!);

  // 1. Calculate BMI using the  formula
  double bmi = weight / (height* height);

  print('\n--- Results ---');
  print('Weight = ${weight.toStringAsFixed(2)} KG' );
  print('Height = ${height.toStringAsFixed(2)} M' );
  print('BMI = ${bmi.toStringAsFixed(2)}');


  // 2. Determine BMI category
  String category;

  if (bmi < 18.5) {
    category = 'Underweight';
  } else if (bmi >= 18.5 && bmi < 25) {
    category = 'Normal weight';
  } else if (bmi >= 25 && bmi < 30) {
    category = 'Overweight';
  } else {
    category = 'Obese';
  }

  print('BMI Category: $category');
}