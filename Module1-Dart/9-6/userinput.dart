import 'dart:io';

void main()
{
    //write-stdout
    //read-stdin

    print("Enter Your Name");
    var name = stdin.readLineSync().toString();

    print("Enter Your Surname");
    var surname = stdin.readLineSync().toString();

    print("Enter Your Age");
    var age = int.parse(stdin.readLineSync().toString());

    print("Your name is $name");
    print("Your surname is $surname");
    print("Your age is $age");
}