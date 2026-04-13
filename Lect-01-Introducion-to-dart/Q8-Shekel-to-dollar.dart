// Question 8:m Shekel to dollar converter 
import 'dart:io';
void main (){
// constant
const double exchange = 3.25 ; // 1 dollar = 3.25 shekels
stdout.write('Enter the amount in Shekels: ... ');
double shekel = double.parse(stdin.readLineSync()!);
double dollar = shekel / exchange;
print('The amount in dollars is: $dollar');
}
