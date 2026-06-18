class TOPS
{
  var a;
  var b;

  void set12(x, y)
  {
    this.a = x;
    this.b = y;
  }

  void add()
  {
    var z = this.a + this.b;
    print(z);
  }
}

void main()
{
  // Creating objects of class TOPS
  TOPS tops1 = new TOPS();
  TOPS tops2 = new TOPS();

  // Without using Cascade Notation
  tops1.set12(1, 2);
  tops1.add();

  // Using Cascade Notation
  tops2..set12(3, 4)..add();
}