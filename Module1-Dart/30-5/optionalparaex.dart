getdetail(String name,String surname,[var email])
{
    if(name==null)
    {
      print("Your surname is $surname");
      print("Your email is $email");
    }
    if(surname==null)
    {
      print("Your name is $name");
      print("Your email is $email");
    }
    if(email==null)
    {
      print("Your name is $name");
      print("Your surname is $surname");
    }
    else
    {
      print("Your name is $name");
      print("Your surname is $surname");
      print("Your email is $email");
    }
}
void main()
{
    getdetail("hiren", "chauhan", "h@gmail.com");
    getdetail("vishal", "shukla");
    getdetail("vishal", "shukla","abcd");

}