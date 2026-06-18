class MyColor
{
    var color="black";
}
class MyColor2 extends MyColor
{
  var color="white";

  display()
  {
    print(color);
    print(super.color);
  }
}
void main()
{
    var m = MyColor2();
    m.display();

}