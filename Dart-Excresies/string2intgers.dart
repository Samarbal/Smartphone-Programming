void main() {
  String yearText = "2595";
  
  String c1 = yearText.substring(0, 1);
  String c2 = yearText.substring(1, 2); 
  String c3 = yearText.substring(2, 3); 
  String c4 = yearText.substring(3, 4); 

  // convert from digit string to integers
  int d1 = int.parse(c1);
  int d2 = int.parse(c2);
  int d3 = int.parse(c3);
  int d4 = int.parse(c4);

  // calaculte the sum 
  int sum = d1 + d2 + d3 + d4;

  // print results
  print('Digits: $d1, $d2, $d3, $d4');
  print('Sum = $sum');
}