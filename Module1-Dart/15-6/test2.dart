class MyData
{
  data()
  {
    try
    {
      int data =10~/0;
      print(data);
    }
    catch(e)
    {
      print(e);
    }
    finally
    {
      print("Executed");
    }

  }
}
void main()
{
  MyData d = MyData();
  d.data();
}