class MyData
{
  checkage(int age)
  {
      if(age>=18)
      {
        print("Eligible to vote");    
      }
      else
      {
          throw Exception("hgjdhg");
      }
  }
}
void main()
{
  MyData d = MyData();
  d.checkage(15);
}