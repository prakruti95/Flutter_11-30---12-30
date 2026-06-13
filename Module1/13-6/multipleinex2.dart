mixin A
{
  a()
  {
    print("a1");
  }
}
mixin B
{
  b()
  {
    print("b1");
  }
}
class C with A,B
{

}
void main()
{
  C c1 = C();
  c1.a();
  c1.b();
}