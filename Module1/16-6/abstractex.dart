abstract class A
{
    a1()
    {
      print("a1");
    }
    a2();
}
class B extends A
{
  @override
  a2()
  {
    print("a2");
  }

}

void main()
{
    B b = B();
    b.a1();
    b.a2();
    //A a = A();
}