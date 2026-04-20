// Average GPA System
import 'dart:io';
void main(){
  double sum = 0;
  int marks = 5;

  print('Enter $marks Student Marks (0-100) :');

  for(int i = 0 ; i< marks ; i++){
     int attempts = 3 ; 
      while(attempts > 0){
        double mark = double.parse(stdin.readLineSync()!);
        if(mark >= 0 && mark <= 100){
          sum += mark;
          break; // exit the while loop if the mark is valid
        } else {
          attempts--;
          if(attempts > 0){
            print('Invalid mark. Please enter a mark between 0 and 100. Attempts left: $attempts');
          } else {
            print('No attempts left. Exiting program.');
            return; // exit the program if no attempts are left
          }
        }
      }
  }
  double average = sum / marks;
  print('\n--- Results ---');
  print('Total Sum: $sum');
  print('Student Average: ${average.toStringAsFixed(2)}%');




}