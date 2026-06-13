class A
{
  a()
  {
    print("a1");
  }
}
class B
{
  b()
  {
    print("b1");
  }
}
class C implements A,B
{
  @override
  a() {
    print("a2");
  }

  @override
  b() {
    print("b2");
  }

}
void main()
{
  C c1 = C();
  c1.a();
  c1.b();
}