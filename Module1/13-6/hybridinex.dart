class P
{
    p()
    {
      print("P called");
    }
}
class Q extends P
{
  q()
  {
    print("Q called");
  }
}
class R extends P
{
  r()
  {
    print("R called");
  }
}
class S extends Q implements R
{
  s()
  {
    print("S called");
  }

  @override
  r() {
      print("R called");
  }
}
void main()
{
    S s1 = S();

    s1.p();
    s1.q();
    s1.r();
    s1.s();
}