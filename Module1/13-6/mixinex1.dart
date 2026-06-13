mixin A
{
    var a =10;
}
mixin B
{
  var a =20;
}
// class D
// {
//
// }
class C  with A,B
{
  display()
  {
      print(super.a);
  }
}
void main()
{
  //A a1 = A();
  C c1 = C();
  c1.display();

}