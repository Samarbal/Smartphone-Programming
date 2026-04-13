// question 7 : get the circle area from user inout 
import 'dart:io';
void main (){
  // constant 
const double pi = 3.14; 
 stdout.write('Enter the radius : ');
 double radius = double.parse(stdin.readLineSync()!);
 double area = pi * radius * radius;
 print('The area of the circle is: $area');
}
