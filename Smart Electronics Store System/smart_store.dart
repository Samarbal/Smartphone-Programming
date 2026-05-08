//  Samar Balousha 


import 'dart:io';
import 'dart:async';


//  device classes 
// ---------------------------------------------------------------

abstract class Device {
  String name;
  String brand;
  double price;
  int quantity;

  // constructer 
  Device({
    required this.name,
    required this.brand,
    required this.price,
    required this.quantity,
  });

  // Method to be overridden by subclasses (Polymorphism)
  void displayInfo();

  // Common method for all devices
  void reduceStock(int qty) {
    if (qty <= quantity) {
      quantity -= qty;
    }
  }
}

// Subclass 1: Phone
class Phone extends Device {
  String operatingSystem;

  Phone({
    required super.name,
    required super.brand,
    required super.price,
    required super.quantity,
    required this.operatingSystem,
  });

  @override
  void displayInfo() {
    print("Phone: $name ($brand) | OS: $operatingSystem | Price: \$${price.toStringAsFixed(2)} | Stock: $quantity");
  }
}

// Subclass 2: Laptop
class Laptop extends Device {
  int ramGB;

  Laptop({
    required super.name,
    required super.brand,
    required super.price,
    required super.quantity,
    required this.ramGB,
  });

  @override
  void displayInfo() {
    print("Laptop: $name ($brand) | RAM: ${ramGB}GB | Price: \$${price.toStringAsFixed(2)} | Stock: $quantity");
  }
}

// Subclass 3: Accessory
class Accessory extends Device {
  String color;

  Accessory({
    required super.name,
    required super.brand,
    required super.price,
    required super.quantity,
    required this.color,
  });

  @override
  void displayInfo() {
    print("Accessory: $name ($brand) | Color: $color | Price: \$${price.toStringAsFixed(2)} | Stock: $quantity");
  }
}




// customer class
// -----------------------------------------------------------

class Customer {
  String name;
  double balance;

  Customer({required this.name, required this.balance});
  void display() {
    print("name: $name | Balance: \$${balance.toStringAsFixed(2)}");
  }
}

// purchase class 
// ----------------------------------------------------
class Purchase{
  String customerName;
  String deviceName;
  int quantity ; 
  double totalPrice ;
  DateTime date;  

  // constructer 
  Purchase(this.customerName, this.deviceName, this.quantity, this.totalPrice):date = DateTime.now(); 
  void display() {
    print("[${date.toLocal()}] $customerName bought $quantity *  $deviceName for \$${totalPrice.toStringAsFixed(2)}");
  }
}

//  Store Management class 
// -----------------------------------------------------------
class StoreManagement { 
// attributes 
List<Device> devices = [];
List<Customer> customers = []; 
List<Purchase> purchases = [];

  // Using Map for fast lookup by device name o(1)
final Map<String, Device> deviceMap = {};


// CRUD operations: create, read, update, delete 

//  add device function 
void addDevice(Device newDevice){
     devices.add(newDevice);
      //  add to map 
      String key = "${newDevice.name}_${newDevice.brand}".toLowerCase();
      deviceMap[key] = newDevice;
      print("device is added "); 
}

//  remove devices 

bool removeDevice(int index){
  if (index >= 0 && index < devices.length) {
      String key = "${devices[index].name}_${devices[index].brand}".toLowerCase();
      deviceMap.remove(key);
      devices.removeAt(index);
      print("Device removed.");
      return true;
    }
    print("Invalid index.");
    return false;

}



//  Disply Devices  functions 
void displayDevices(){
    if (devices.isEmpty) {
      print("No devices.");
      return;
    }
    print("\n===== All Devices =====");
   for (int i = 0; i < devices.length; i++) {
  print("Index [$i]");
  devices[i].displayInfo();
}
    print("");
}

// search devices 
Device? searchDevice(String name) {
  for (var d in devices) {
    if (d.name.toLowerCase() == name.toLowerCase()) {
      return d;
    }
  }
  return null;
}

// update device price 
void updateDevicePrice(int index, double newPrice){

  if (index >= 0 && index < devices.length) {
      devices[index].price = newPrice; print("Device price updated successfully.");
    }
   else print("Invalid index.");
    
}


// ---------- Customer functions   ----------
//  add customer function 
void addCustomer (Customer c ){
  customers.add(c); 
  print("Customer added successfully.");
}

//display customers  
void showCustomers() {
  if(customers.isEmpty){
    print("No customers found"); 
    return;
  }
  print("---Customers---");
    for (var c in customers) {
      c.display();
    }
  }




// find customer by name                      
Customer? findCustomer(String name){
  for (var c in customers){
    if (c.name.toLowerCase() == name.toLowerCase()){
      return c; 
    }
  } 
  return null; 
}



// --------------purchase 

Future<bool> purchaseDevice({required Customer customer, required int deviceIndex, required int quantity, bool applyDelay = true})async{
try{
 
  //  check devices 
  if(deviceIndex <0 || deviceIndex >= devices.length){
    print("invalied device index"); 
    return false;
  }
  // check devices quantity 
  Device device = devices[deviceIndex];
  if (device.quantity < quantity){
    print("insufficient stock, available : ${device.quantity}"); 
    return false; 
  }
  //  check the input quantity 
  if(quantity <= 0 ){
    print("quantity must br >0"); 
    return false; 
  }

  // total price 
  double total = device.price * quantity;

  //  check customer bsalnca 
  if (customer.balance < total ){
    print("insufficient balance "); 
    return false; 
  }

  // simulate  delay (async)
   if (applyDelay) {
     print(" processing purchase");
     await Future.delayed(Duration(seconds: 2));
     print(" Done."); }

  // execute purchase and update data (reduce quantity and balnce )

  device.reduceStock(quantity);
  customer.balance -=total ;
  purchases.add(Purchase( customer.name, device.name, quantity, total)); 


  print("\n Purchase successful!");
  print("   Customer: ${customer.name}");
  print("   Device: ${device.name}");
  print("   New stock: ${device.quantity}");
  print("   Remaining balance: \$${customer.balance.toStringAsFixed(2)}");
return true; 
}
catch (e) {
      print(" Unexpected error during purchase: $e");
      return false;
    }
}

// display purches history 
 void displayPurchaseHistory() {
    if (purchases.isEmpty) {
      print("No purchases yet.");
      return;
    }
    print("\n===== Purchase History =====");
    purchases.forEach((purchase) => purchase.display());
    print("");
  }

  void displayCustomerPurchases(String customerName) {
    List<Purchase> customerPurchases = purchases.where((p) => p.customerName == customerName).toList();
    if (customerPurchases.isEmpty) {
      print(" No purchases for $customerName.");
      return;
    }
    print("\n===== $customerName's PURCHASES =====");
    
    customerPurchases.forEach((p) => p.display());
    print("");
  }

}



// helper functions -----------------------

// 1. get positive integers 
int getPositiveInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input == null) continue;
    int? value = int.tryParse(input);
    if (value != null && value >= 0) return value;
    print("Invalid input. Enter a positive integer.");
  }
}

// 2. get positive double 
double getPositiveDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input == null) continue;
    double? value = double.tryParse(input);
    if (value != null && value >= 0) return value;
    print("Invalid input. Enter a positive number.");
  }
}

// 3.  non empty string 
String getNonEmptyString(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input != null && input.trim().isNotEmpty) return input.trim();
    print("Input cannot be empty.");
  }
}


//      ------- manager login function 

bool managerLogin(){
  print("--- Manager Login --- ");
  String username = getNonEmptyString("Username : "); 
  String password = getNonEmptyString("Password : "); 

  if (username == "admin" && password == "123") 
  { print("Welcome Manager."); 
  return true; } 
  
  print("Invalid credentials."); 
  return false;



}





// main 
// -----------------------------------------------
void main() async {
  var manager = StoreManagement();


  manager.addDevice(Phone(name: "SM-31", brand: "Samsung", price: 2000, quantity: 2, operatingSystem: "android"));
  manager.addDevice(Laptop(name: "acer", brand: "acer", price: 1000, quantity: 1, ramGB: 8));
  manager.addDevice(Accessory(name: "charger", brand: "EZZ", price: 20, quantity: 3, color: "black"));
  manager.addCustomer(Customer(name: "Samar", balance: 1500));
  manager.addCustomer(Customer(name: "Mohamed", balance: 3000));


// ======== // MAIN LOOP // ========= 
while (true) 
{ 
  print("\n========== Smart Electronics Store System ==========");
  print("1. Manager");
  print("2. Customer"); 
  print("3. Exit"); 
  int mainChoice = getPositiveInt("Choice: ");
// =========== // MANAGER // =======
  if (mainChoice == 1) 
      { if (!managerLogin()) { continue; } 
        bool managerSession = true; 
        while (managerSession) {
          print("\n========== MANAGER MENU ==========");
          print("1. Add Device"); 
          print("2. Display Devices"); 
          print("3. Search Device"); 
          print("4. Remove Device");
          print("5. Update Device Price");
          print("6. Add Customer"); 
          print("7. Display Customers"); 
          print("8. Display Purchase History"); 
          print("9. Logout");
          int choice = getPositiveInt("Choice: "); 
          //  switch cases for manager 
          switch (choice)  { 
            //  case1 add device 
              case 1: 
              String type = getNonEmptyString( "Device Type (phone/laptop/accessory): "); 
              String name = getNonEmptyString("Name: "); 
              String brand = getNonEmptyString("Brand: "); 
              double price = getPositiveDouble("Price: "); 
              int quantity = getPositiveInt("Quantity: "); 
              if (type.toLowerCase() == "phone") { 
                String os = getNonEmptyString("OS: "); 
                manager.addDevice( Phone( name: name, brand: brand, price: price, quantity: quantity, operatingSystem: os, ), ); } 
              else if (type.toLowerCase() == "laptop") {
                 int ram = getPositiveInt("RAM: ");
                 manager.addDevice( Laptop( name: name, brand: brand, price: price, quantity: quantity, ramGB: ram, ), ); } 
              else if (type.toLowerCase() == "accessory") {
                 String color = getNonEmptyString("Color: ");
                manager.addDevice( Accessory( name: name, brand: brand, price: price, quantity: quantity, color: color, ), ); } 
              else { print("Invalid device type."); } 

                        break; 

            // case 2 dispaly devices 
             case 2:
              manager.displayDevices(); 
              break;


              // case 3 : search byname  
                
            case 3:
            String searchName = getNonEmptyString( "Enter device name: "); 
            Device? device = manager.searchDevice(searchName); 
            if (device == null) 
            { print("Device not found."); }
            else 
            { device.displayInfo(); } 
            break;
            // case 4 : remove a device 
            case 4: 
            manager.displayDevices(); 
            int removeIndex = getPositiveInt( "Enter device index to remove: ");
            manager.removeDevice(removeIndex);
            break; 

            // case 5: update devices 
            case 5:
            manager.displayDevices(); 
            int updateIndex = getPositiveInt( "Enter device index: "); 

            double newPrice = getPositiveDouble( "Enter new price: "); 
            manager.updateDevicePrice( updateIndex, newPrice); 
            break; 

            // case 6 add cudtomer 
            case 6: 
            String customerName = getNonEmptyString( "Customer Name: "); 
            double balance = getPositiveDouble( "Balance: "); 
            manager.addCustomer( Customer( name: customerName, balance: balance, ), );
             break; 

            //  case 7  show costimers 
            case 7:
            manager.showCustomers();
            break;

            //  case 8: show purchase history 
            case 8:
            manager.displayPurchaseHistory();
            break;

            // case 9 : logout 
            case 9:
            managerSession = false;
            print("Logged out."); 
            break;
            default:
            print("Invalid choice."); 
            } 
            }
             } 


            //========== // CUSTOMER // =====
         else if (mainChoice == 2) 
            {
              String customerName = getNonEmptyString( "Enter your name: "); 
              Customer? customer = manager.findCustomer(customerName);
              if (customer == null) {
                 print( "Customer not found. Ask manager to add you."); 
                 continue; }
              bool customerSession = true; 
              while (customerSession) 

              {print("----------Smart Electronics Store System------------");
                 print("\n========== CUSTOMER MENU =========="); 
                print("1. Display Devices"); 
                print("2. Search Device");
                print("3. Buy Device"); 
                print("4. My Purchase History");
                print("5. Logout"); 
                int choice = getPositiveInt("Choice: "); 
                switch (choice) 

              { case 1:
              //  cas 1 display devices 
                manager.displayDevices();
                break;

                //  case 2 : search  for device 
                case 2: 
                String searchName = getNonEmptyString( "Enter device name: ");
                Device? device = manager.searchDevice(searchName);
                if (device == null) {
                   print("Device not found."); }
                else
                { device.displayInfo(); } 
                break;

                // buy a device
                case 3:
                manager.displayDevices();
                int deviceIndex = getPositiveInt( "Enter device index: "); 
                int quantity = getPositiveInt( "Enter quantity: ");
                await manager.purchaseDevice( customer: customer, deviceIndex: deviceIndex, quantity: quantity, );

                break; 

                // case 4: show customer purchases history 
              case 4:
                manager.displayCustomerPurchases( customer.name); 
              break;

              // case 5 logout 
                case 5:
                customerSession = false; 
              print("Logged out.");
                break;
                default: 
              print("Invalid choice."); } } } 
              // === // EXIT // ======

       else if (mainChoice == 3) 
              { print("Program terminated."); break; } 
              else { print("Invalid choice."); }

              }
              
                }