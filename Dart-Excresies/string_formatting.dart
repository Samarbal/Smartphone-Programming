import 'dart:io';

void main() {
  // Ask the user to enter a text
  print('Please enter some text (you can add extra spaces):');
  
  // Read the input and store it in 'raw'
  String? raw = stdin.readLineSync();

  //  Remove spaces from the start and end using trim()
  String clean = raw!.trim();

  // Convert to all uppercase
  String upper = clean.toUpperCase();

  // Convert to all lowercase
  String lower = clean.toLowerCase();

  // Print the results 
  print('Clean: $clean');
  print('Upper: $upper');
  print('Lower: $lower');
}