import 'dart:io';

void main(){
  print('Please enter the radius of the circle:');
  
  double radius = double.parse(stdin.readLineSync()!);
  double pi = 22/7 ;
  double area = (radius* radius* (22/7)); 
  double perimeter = (2 *pi * radius); 
  print("--- Circle Info --- ");
  print("Raduis : ${radius.toStringAsFixed(2)} ");
   print("Area : ${area.toStringAsFixed(2)} cm2 ");
    print("Perimeter : ${perimeter.toStringAsFixed(2)} cm ");

  

}