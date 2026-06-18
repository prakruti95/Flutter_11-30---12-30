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
class C extends B
{
  void c1()
  {
    print("C1 Called");
  }
}
class D extends C
{
  void d1()
  {
    print("D1 Called");
  }
}
void main()
{

    D d1 = D();
    d1.a1();
    d1.b1();
    d1.c1();
    d1.d1();
}