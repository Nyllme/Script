void main() {
  var numbersByTwo = const [1, -2, 3, 42].map((number) => number * 2);
  var raw = const [1, -2, 3, 42];
  print('Numbers: $numbersByTwo');
  print(raw.runtimeType);
  print(numbersByTwo.runtimeType);
}
