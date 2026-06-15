class RBI
{

    roi()
    {
      return 0;
    }
}
class SBI extends RBI
{
  roi()
  {
    return 7;
  }
}
class ICICI extends RBI
{
  roi()
  {
    return 8;
  }
}
class AXIS extends RBI
{
  roi()
  {
    return 9;
  }
}

void main()
{
  // var s = SBI();
  // print(s.roi());
  // var i = ICICI();
  // print(i.roi());
  // var a = AXIS();
  // print(a.roi());

  var r = RBI();

  r = SBI();
  print(r.roi());

  r = ICICI();
  print(r.roi());

  r = AXIS();
  print(r.roi());
}