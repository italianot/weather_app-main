Future<void> main() async {
  print(0);
  f();
  print(2);
}

Future<void> f() async {
  print(1);
}
