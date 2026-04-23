import 'dart:io';

void main() {


   int attempts = 0;
  const int maxAttempts = 3;
  bool authenticate = false; 
  print("Welcome to the Bank System!");
  // login loop

  do {
    // let the suer enter username and password 
    stdout.write("Enter username: ");
    String user = stdin.readLineSync()!;
    stdout.write("Enter password: ");
    String pass = stdin.readLineSync()!;
  

  //  استدعاء داللة login 
     authenticate=login(userInput: user, passwordInput: pass); 

    if (!authenticate){
      attempts++ ; 
      if (attempts < maxAttempts) {
        print("You have entered a wrong password or username");
        print(" Please try again. Attempts left: ${maxAttempts - attempts}");
      }
    }
 
} while (attempts < maxAttempts && authenticate == false);

if (attempts == maxAttempts) {
    print("Maximum login attempts reached. Exiting the program.");
   return; 
   
  }


//= after successful login, start the bank system  

startBankingMenu();  



}
// -----------------------------------------------------
// login function ==> just for compare between the user input and the stored user name and password  
bool login({ required String userInput , required String passwordInput }) {
  // required named parameters 
  //  variables
  const String storedUsername = "SAMAR BALOUSHA";
  const String storedPassword = "2026";

  if (userInput == storedUsername && passwordInput == storedPassword) {
    print("Login successful! Welcome, $storedUsername.");
    return true; 
  } else {
    return false; 
  }
}
// -----------------------------------------------------------------

//  start bank menu 
void startBankingMenu() {
  double balance = 0.0;
  bool isRunning = true;

  while (isRunning) {
    print('\n--- Banking System Menu ---');
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Check Balance');
    print('4. Logout');
    stdout.write('Select an option: ');

    int? choice = int.tryParse(stdin.readLineSync()!);

    switch (choice) {

      // deposit
      case 1:
        double? amount;
        //   enter the amount and checks its valid 
        do {
          stdout.write('Enter deposit amount: ');
          amount = double.tryParse(stdin.readLineSync()!);

          if (amount == null) {
            print('Invalid input. Please enter a number.');
            continue;
          }
          if (amount <= 0) {
            print('Amount must be positive.');
            amount = null;
          }

        } while (amount == null);

        balance = deposit(amount: amount, currentBalance: balance, note: 'Deposit made on ${DateTime.now()}');
        break;

      // withdraw
      case 2:
        double? amount;

        do {
          stdout.write('Enter withdrawal amount: ');
          amount = double.tryParse(stdin.readLineSync()!);

          if (amount == null) {
            print('Invalid input. Please enter a number.');
            continue; }

          if (amount <= 0) {
            print('Amount must be positive.');
            amount = null;}

        } while (amount == null);

        balance = withdraw( amount: amount, currentBalance: balance, note: 'Withdrawal made on ${DateTime.now()}');
        break;

    // check balnace 
      case 3:
        checkBalance(balance);
        break;
//  log out 
      case 4:
        print('Logging out... Goodbye!');
        isRunning = false;
        break;

      default:
        print('Invalid option. Please try again.');
    }
  }
}
// -----------------------------------------------

// deposit function
double deposit({required double amount, required double currentBalance, String? note}) {
  if (amount <= 0) {
    print('!!!  Amount must be positive.');
    return currentBalance;
  }
  double newBalance = currentBalance + amount;
  print('Successfully deposited: ${amount.toStringAsFixed(2)} nis');
   print("New Balance: ${newBalance.toStringAsFixed(2)} nis");
   if (note != null) {
     print('Note: $note'); }
  return newBalance;
}

// ----------------------------------------------SA
// withdraw function
double withdraw({required double amount, required double currentBalance , String? note}) {
  if (amount <= 0) {
    print('Error: Amount must be positive.');
    return currentBalance;
  }
  if (amount > currentBalance) {
    print('Insufficient balance! You only have ${currentBalance.toStringAsFixed(2)} nis');
    return currentBalance;
  }
  double newBalance = currentBalance - amount;
  print('Withdrew: ${amount.toStringAsFixed(2)} nis');
  print('New Balance: ${newBalance.toStringAsFixed(2)} nis');

   if (note != null) {
     print('Note: $note'); }
  return newBalance;

}
// -------------------------------------------------- 
// check balance
void checkBalance(double balance) {
  print('Your current balance is: ${balance.toStringAsFixed(2)} nis ');
}