import 'dart:io';

void main() {
  print("Enter Your Marks");
  var marks = int.parse(stdin.readLineSync().toString()); //55

  if (marks >= 70) {
    print("A Grade");
  }
  if (marks >= 60) {
    print("B Grade");
  }

  if (marks >= 50) {
    print("C Grade");
  }
  if (marks >= 40) {
    print("D Grade");
  } else {
    print("Fail");
  }
}
