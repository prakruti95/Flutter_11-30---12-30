class A
{
    void a1()
    {
        print("A1 Called");
    }
}
class B extends A
{
  void b1()
  {
      print("B1 Called");
  }
}
void main()
{

    B b1 = B();

    b1.a1();
    b1.b1();
}