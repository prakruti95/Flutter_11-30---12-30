import 'dart:io';

void main()
{
    for(int i=1;i<=5;i++)//row
    {
      for(int j=1;j<=i;j++)//col
      {
        stdout.write(j);
      }
      print("");

    }
}