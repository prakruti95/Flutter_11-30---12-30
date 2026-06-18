class Tops
{
    var id;
    var name;
}
void main()
{
    //how to create an object
     Tops t1 = new Tops();
     Tops t2 = Tops();
    // var t3 = Tops();

    //value assign

     t1.id=101;
     t1.name="hiren";

     t2.id=102;
     t2.name="yogesh";

     print("\n Your id is: ${t1.id} and \n Your name is: ${t1.name}");
     print("\n Your id is: ${t2.id} and \n Your name is: ${t2.name}");


}