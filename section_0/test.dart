void main() {
  List<int> even = [
    2,
    4,
    6,
    8,
  ];

  List<int> odd = [
    1,
    3,
    5,
    7,
  ];

  // cascading operator
  // ...

  print([...even, ...odd]); // [2, 4, 6, 8, 1, 3, 5, 7]
  print(even); // [2, 4, 6, 8]
  print([...even]); // [2, 4, 6, 8]
  print(even == [...even]); // false

}
