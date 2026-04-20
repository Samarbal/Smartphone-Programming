// 4. Write a Dart program that receives a username and password from the user and checks them against a pre-stored username and password. If they match, the user logs in. If the username or password is incorrect, the user is given only three attempts, including the first attempt. If that attempt is also incorrect, use Do-While
import 'dart:io';
void main() {

// credentials 
const String storedUsername = "SAMAR BALOUSHA";
const String storedPassword = "10002000";

String username;
String password;
int attempts = 0;
const int maxAttempts = 3;  
do {
  print("Enter your username:");
  username = stdin.readLineSync()!;

  print("Enter your password:");
  password = stdin.readLineSync()!;

  attempts++;

  if (username == storedUsername && password == storedPassword) {
    print("Login successful! Welcome, $storedUsername.");
    break;
  } else {
    if (attempts < maxAttempts) {
      print("Incorrect username or password. Please try again. Attempts left: ${maxAttempts - attempts}");
    } else {
      print("Incorrect username or password. No attempts left. Access denied.");
    }
  }
 } while (attempts < maxAttempts);

}