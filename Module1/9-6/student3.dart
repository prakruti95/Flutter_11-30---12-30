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

     Tops t1 = new Tops(101,"hiren");
     Tops t2 = Tops(102,"yogesh");
     Tops t3 = Tops(103,"vishal");
     Tops t4 = Tops(104,"vipul");
     Tops t5 = Tops(105,"hardik");

     t1.display();
     t2.display();
     t3.display();
     t4.display();
     t5.display();


}