class Getdata
{
    var a;
    var b;
    getdetail(var a,var b)
    {
      this.a=a;
      this.b=b;
    }
}
class AR extends Getdata
{
    area1()
    {
        var ans = a*b;
        print(ans);
    }
}
class AT extends Getdata
{
  area2()
  {
    var ans = 0.5*a*b;
    print(ans);
  }
}
void main()
{
    AR a1 = AR();
    AT a2 = AT();

    a1.getdetail(6,3);
    a2.getdetail(5,2);
    a1.area1();
    a2.area2();
}