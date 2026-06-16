Future delayprint(int sec, String msg)
{
  final duration = Duration(seconds: sec);
  return Future.delayed(duration).then((value) => msg);
}

void main()async
{
    print("Life");

    await delayprint(3,"Is").then((status)
    {
      print(status);
    });

    print("Good");
}