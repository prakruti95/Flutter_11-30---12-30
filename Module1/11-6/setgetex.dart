class Tops
{
    var _name;
    var _surname;

    get name => _name;

    set name(value) {
      _name = value;
    }

    get surname => _surname;

    set surname(value) {
      _surname = value;
    }
}

void main()
{
    Tops t1 = Tops();

    //set
    t1._name="tops";
    t1._surname="tech";

    //get
    print("${t1._name} ${t1._surname}");
}