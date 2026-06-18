class Tops
{
    //data member
    var id;
    var name;

    //method
    display()
    {
      print("\n Your id is: $id and \n Your name is: $name");
    }
}
void main()
{
    //how to create an object
     Tops t1 = new Tops();
     Tops t2 = Tops();
     Tops t3 = Tops();
     Tops t4 = Tops();
     Tops t5 = Tops();
    // var t3 = Tops();

    //value assign

     t1.id=101;
     t1.name="hiren";

     t2.id=102;
     t2.name="yogesh";

     t3.id=103;
     t3.name="xyz";

     t4.id=104;
     t4.name="abcd";

     t5.id=105;
     t5.name="tyui";

     t1.display();
     t2.display();
     t3.display();
     t4.display();
     t5.display();


}