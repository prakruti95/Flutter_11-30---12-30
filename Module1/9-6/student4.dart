import 'dart:io';

class Tops
{

    var id;
    var name;

    //constructor-para
    Tops(var i,var n)
    {
      id = i;
      name = n;
    }

    display()
    {
      print("\n Your id is: $id and \n Your name is: $name");
    }
}
void main()
{
      print("Enter Your Id");
      var id = stdin.readLineSync().toString();
      print("Enter Your Name");
      var name = stdin.readLineSync().toString();
      Tops t1 = new Tops(id,name);
      t1.display();


}