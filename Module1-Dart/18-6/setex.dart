import 'dart:ffi';

void main()
{
  Set set = Set();

  set.add(10);
  set.add(20);
  set.add(30);
  set.add(40);
  set.add(10);

  print(set);
}