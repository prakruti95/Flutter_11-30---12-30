import 'dart:io';

void main()
{
  print("Enter Any Number");
  int num = int.parse(stdin.readLineSync().toString());

  int ld = num%10;
  var fd;

  while(num>0)
  {
    if(num>9)
    {
      num = num~/10;
    }
    else
    {
        fd = num;
        num=num~/10;
    }
  }

  int ans = fd+ld;
  print(ans);


}