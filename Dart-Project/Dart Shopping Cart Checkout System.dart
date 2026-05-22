// Shopping Cart and Checkout System in Dart


//  item class to represent a product in the shopping cart
class Item {
  int id;
  String name; 
  double price ; 
  int qty ; 

  Item(this.id, this.name, this.price, this.qty);

  void printItem(){
    print('ID: $id || Name: $name  || Price: \$${price.toStringAsFixed(2)}  ||   Quantity: $qty');
  }
}

//  cart class to manage the shopping cart

class Cart {
  List<Item> items =[];
  void addItem(Item item){
    for (var i in items){
      if (i.id == item.id){
        i.qty += item.qty;
        return;
      }
    }
    items.add(item);
    print('Item added to cart: ${item.name}');
  }

// remove an item method : remove one item , it quantity = 0 remove the item
  void removeItem(int id ){
    for (int i = 0; i< items.length ; i++){
      if(items[i].id == id ){

        if (items[i].qty > 0){
          items[i].qty -= 1;
        } 
        if (items[i].qty == 0){
          items.removeAt(i);
        }
 break;
      }
     
    }
  }

  //  subtotal method : sum of (price * quantity) for all items 

  double subtotal(){
    double total = 0.0;
    for (var item in items){
      total += item.price * item.qty;
    }
    return total;
  }

  // print all items and the subtotal
  void printCart(){
    print('Shopping Cart');
    for (var item in items){
      item.printItem();
    }
    print('Subtotal: \$${subtotal().toStringAsFixed(2)}');
  }

  // clear cart method : remove all items from the cart
  void clearCart(){
    items.clear();
    print('Cart cleared');
  }


}

// checkOut Class
class Checkout extends Cart {


  double deliveryFee = 10.0; // fixed delivery fee

  // tax = 10% og subtotal 
  double get tax => subtotal() * 0.10;

  // total = subtotal + tax + delivery fee
  double get total => subtotal() + tax + deliveryFee;

  // print full invoice method : items , subtotal, tax, delivey fees, total 
  void printInvoice(){
    print('--- Invoice ---');
    for (var item in items){
      item.printItem();
    }
    print('Subtotal: \$${subtotal().toStringAsFixed(2)}');
    print('Tax (10%): \$${tax.toStringAsFixed(2)}');
    print('Delivery Fee: \$${deliveryFee.toStringAsFixed(2)}');
    print('Total: \$${total.toStringAsFixed(2)}');
  }


}


//  Main Method : 
void main(){
  
  Item Shirt = Item(1, 'T-Shirt', 50.0, 1);
  Item Jeans = Item(2, 'Jeans', 80, 2);
  Item Scarf = Item(3, 'Scarf', 30, 1);

  


  Checkout checkout = Checkout();

  checkout.addItem(Shirt);
  checkout.addItem(Jeans);
  checkout.addItem(Scarf);
    checkout.addItem(Shirt);  // increase quantity of shirt to 2

  checkout.printCart();


  checkout.removeItem(3);
  print(" after remove "); 

  checkout.printInvoice();

}