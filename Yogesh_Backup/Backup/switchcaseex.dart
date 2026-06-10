import 'dart:io';

void main() {
  print("Enter Any Number");
  var num = int.parse(stdin.readLineSync().toString());

  switch (num) {
    case 1:
      print("English");
      //break;

    case 2:
      print("Hindi");
      //break;

    case 3:
      print("Gujarati");
     // break;

    default:
      print("Num is not valid");
  }
}
