// Question 12: Time Converter from minutes to days and years 
import 'dart:io';
void main(){
  stdout.write('Enter the time in minutes : __');
  int minutes = int.parse(stdin.readLineSync()!);
  int days = minutes ~/ (60 * 24);
  int years = days ~/ 365;
  int remainderDays = days % 365;
  print('$minutes minutes is approximately $years years and $remainderDays days');
}
