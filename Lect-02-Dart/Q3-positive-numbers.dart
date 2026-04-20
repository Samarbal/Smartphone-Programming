//  Positive numbers 

import 'dart:io';
void main(){
 int count = 0;  // count the number of positive numbers entered
 double sum = 0.0;  // summation of positive numbers 
 int retryCount = 0;  //count the number of tries

 print("Enter 10 positive numbers:");
 double number ; 

 while (count< 10){
  number = double.parse(stdin.readLineSync()!);
  if (number > 0) {
    sum += number; // add the positive number to the sum
    count++; // increment the count of positive numbers
  } else {
    retryCount++;
    print("Please enter a positive number. Try again.");
  }
 }
//   final results
print("---------------------------------------------------- "); 
print("The sum of the 10 positive numbers id : $sum "); 
print("Total number of positive numbers entered: $count");
print ("Number of invalid attempts: $retryCount");


}
