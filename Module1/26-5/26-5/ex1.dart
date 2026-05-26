import 'dart:io';

void main()
{
  print("Enter Any Number");
  int num = int.parse(stdin.readLineSync().toString());

  //int num =1234;//123//12//1
  int sum = 0;
  while(num>0)
  {
      int rem = num%10;//4//3//2//1
      sum+=rem;//4+3=7+2=9+1=10
      num=num ~/10;//123//12//1//0
  }

  print("Sum of all Digits are: $sum");
}