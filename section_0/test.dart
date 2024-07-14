void main() async{
// Validation
final minJi = ('민지', 20);
final (name as String, age as int) = minJi;

print(name); // 민지
print(age); // 20

switcher('aaa'); // match: aaa
switcher('bbb'); // no match
switcher(['1','2']); // match: [1, 2]
switcher([1,2]); // match: [int 1, int 2]
switcher([4,5,6]); // match: [_, _, _]
switcher([4,5,6,7]); // no match
switcher([6, 9]); // match: [int 6, int 9]
switcher([6, "9"]); // no match
switcher(102); // match: < 100 && > 1000 -> 위에꺼 주석하고 봐야함 아니면 에러
switcher(10000); // no match

print('----------------');

print(switcher2(5, true)); // match: 5
print(switcher2(7, true)); // no match
print(switcher2(7, false)); // match 7 and true

print('----------------');

forLooper();
/*
  민지
  20
  해린
  19
  -----loop-----
  민지
  20
  해린
  19
*/

ifMatcher();
/*
  -----if-----
  민지
  20
*/
}

void switcher(dynamic anything){
  switch(anything){
    case 'aaa' : 
    print('match: aaa');
    case ['1','2']:
    print('match: [1, 2]');
    case [_, _, _]:
    print('match: [_, _, _]');
    case [int a, int b]:
    print('match: [int $a, int $b]');
    // case > 100 && < 1000:
    // print('match: < 100 && > 1000');
    default:
    print('no match');
  }
}

String switcher2(dynamic val, bool condition) => switch (val) {
  5 => 'match: 5',
  7 when !condition => 'match 7 and true',
  _ => 'no match',
};

void forLooper(){
  final List<Map<String, dynamic>> members = [
    {
      'name' : '민지',
      'age' : 20,
    },
    {
      'name' : '해린',
      'age' : 19,
    },
  ];

  for(final member in members){
    print(member['name']);
    print(member['age']);
  }

  print('-----loop-----');

  for(var {'name': name, 'age': age} in members){
    print(name);
    print(age);
  }
}

void ifMatcher(){
  final minji = {
    'name' : '민지',
    'age' : 20,
  };

  print('-----if-----');
  if(minji case {'name': String name, 'age' : int age}){
    print(name);
    print(age);
  }
}

