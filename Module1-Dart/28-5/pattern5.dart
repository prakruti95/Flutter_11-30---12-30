import 'dart:io';

void main()
{
    int alpha=64;
    for(int i=1;i<=5;i++)//row
    {
      for(int j=1;j<=i;j++)//col
      {
        stdout.write(String.fromCharCode(alpha+i));

      }

      print("");

    }

}