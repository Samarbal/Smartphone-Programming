// Introduction to Dart programming language

import 'dart:io';


void main () {

  print('Hello, Dart!');
  stdout.write('What is your name? ');
  String name = stdin.readLineSync()!;
  print('Hello, $name!');
  }
  