//  6. Write a Dart program that receives and analyzes the user's temperature.
// If the temperature is below 0°C, print: "It's freezing, stay home."
// If it's between 0°C and 20°C, print: "It's cold, wear a jacket."
// If it's between 21°C and 30°C, print: "The weather is nice today."
// If it's above 30°C, print: "It's hot, stay hydrated.

import 'dart:io';
void main(){
  print("Good morning! Please enter today's temperature in Celsius:");
  double temperature = double.parse(stdin.readLineSync()!);
  if (temperature < 0) {
    print("It's freezing, stay home.");
  } else if (temperature <= 20) {
    print("It's cold, wear a jacket.");
  } else if (temperature <= 30) {
    print("The weather is nice today.");
  } else {
    print("It's hot, stay hydrated.");
  }

}
