import 'dart:io';

void main() {
  print("Enter Your Name");
  var name = stdin.readLineSync().toString();

  print("Enter Your Age");
  var age = int.parse(stdin.readLineSync().toString());

  print("Enter Your Salary");
  var salary = double.parse(stdin.readLineSync().toString());

  print("$name and $age and $salary");

  if (age >= 18) {
    print("Eligible to vote");
  } else {
    print("Not Eligible to vote");
  }
}
