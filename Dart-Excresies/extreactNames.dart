import 'dart:io';

void main() {
  // Ask the user to enter their full name 
  print('Please enter your full name (First and Last):');
  String? fullName = stdin.readLineSync();

  if (fullName != null && fullName.contains(' ')) {
    // Find the position of the space between the names
    int spaceIndex = fullName.indexOf(' ');

    // Use substring to extract the parts
    String firstName = fullName.substring(0, spaceIndex);
    
    // From the character after the space (spaceIndex + 1) until the end
    String lastName = fullName.substring(spaceIndex + 1);

    //  Print the results
    print('First name: $firstName');
    print('Last name : $lastName');
  } else {
    print('Please enter a full name with a space between the names.');
  }
}