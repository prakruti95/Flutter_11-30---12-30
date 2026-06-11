class Abcd
{

  var name;
  var surname;
  var email;

  Abcd(var name,var surname,var email)
  {
      this.name = name;
      this.surname = surname;
      this.email = email;
  }

  display()
  {
    print("Your name is $name");
    print("Your surname is $surname");
    print("Your email is $email");
  }

}
void main()
{
  Abcd a1 = Abcd("yogesh", "xyz", "y@gmail.com");
  Abcd a2 = Abcd("hiren", "xyz", "h@gmail.com");

  a1.display();
  a2.display();
}