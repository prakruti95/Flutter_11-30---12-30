import 'dart:ffi';

void main()
{
  //var list = [];
  List list = [10,20,"a"];
  list.add(30);
  list.add("b");
  list.add("c");
  List list2 = [40,"d",10];
  list.addAll(list2);
  list.remove(30);
  list.removeAt(2);
  print(list);

  //List<String> list2 = [10,20,"a"];
}