import 'dart:io';

void main() {
  print('Please enter the amount in USD:');
  
  double amountUSD = double.parse(stdin.readLineSync()!);

  // Define the fixed rate
  double rate = 3.67;

  //  result
  double nis = amountUSD * rate;

  // Print the output 
  print('--- Results ---');
  print('USD = ${amountUSD.toStringAsFixed(2)}');
  print('NIS = ${nis.toStringAsFixed(2)}');
}