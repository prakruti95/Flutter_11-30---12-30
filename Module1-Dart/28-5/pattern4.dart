import 'dart:io';

void main()
{
    int num=1;
    for(int i=1;i<=4;i++)//row
    {
      for(int j=1;j<=i;j++)//col
      {
        stdout.write(num);
        num++;
      }

      print("");

    }

}