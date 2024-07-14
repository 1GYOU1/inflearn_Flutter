# Dart 3.0 업데이트 주요내용

### recode

- 리스트를 규격화해서 표현할 수 있는 기능 (Tuple이랑 비슷)
- https://dart.dev/language/records

```dart
void main() async{
  final result = nameAndAge({
    'name' : '민지',
    'age' : 20,
  });

  print(result);
  print(result.$1);
  print(result.$2);
  /*
    (민지, 20)
    민지
    20
  */

  print('---------------');

  final result3 = getNewJeansWithType();
  for(final item in result3){
    print(item.$1);
    print(item.$2);
  }
  /*
    민지
    20
    해린
    18
  */

  print('---------------');

  final result4 = getNewJeansWithType2();
  for(final item in result4){
    print(item.$1);
    print(item.$2);
  }
  /*
    민지
    20
    해린
    18
  */

  print('---------------');

  final result5 = getNewJeansWithType3();
  for(final item in result5){
    print(item.name);
    print(item.age);
  }

  /*
    민지
    20
    해린
    18
  */

  print('---------------');

  final result6 = getMinji();
  print(result6);
  // (민지, 뉴진스, 19)
}

// Recode
(String, int) nameAndAge(Map<String, dynamic> json){
  return (json['name'] as String, json['age'] as int);
}

List<Map<String, dynamic>> getNewJeans(){
  return [
    {
      'name' : '민지',
      'age' : 20,
    },
    {
      'name' : '해린',
      'age' : 18,
    }
  ];
}

List<(String, dynamic)> getNewJeansWithType(){
  return [
    (
      '민지',
      20,
    ),
    (
      '해린',
      18,
    ),
  ];
}

List<(String name, dynamic age)> getNewJeansWithType2(){
  return [
    (
      '민지',
      20,
    ),
    (
      '해린',
      18,
    ),
  ];
}

List<({String name, dynamic age})> getNewJeansWithType3(){
  return [
    (
      name : '민지',
      age : 20,
    ),
    (
      name : '해린',
      age : 18,
    ),
  ];
}

(String name, String group, int age) getMinji(){
  return ('민지', '뉴진스', 19);
}
```

### Destructuring (구조 분해 문법)
- 값을 받아올 때 값을 분해한 상태로 받아올 수 있음.

```dart
void main() async{
  final (name, age) = ('민지', 20);

  print(name);
  print(age);
  /*
    민지
    20
  */
  print('-----------');

  final newJeans = ['민지', '해린'];
  final [String a, String b] = newJeans;

  print(a);
  print(b);
  /*
    민지
    해린
  */
  print('-----------');

  final numbers = [1,2,3,4,5,6,7,8];
  final [x,y, ..., z] = numbers;

  print(x);
  print(y);
  print(z);
  /*
    1
    2
    8
  */
  print('-----------');

  final [xx,yy, ...rest, zz] = numbers;

  print(xx);
  print(yy);
  print(zz);
  print(rest);
  /*
    1
    2
    8
    [3, 4, 5, 6, 7]
  */
  print('-----------');

  final [xxx,yyy, ...rest2, zzz, _] = numbers;

  print(xxx);
  print(yyy);
  print(zzz);
  print(rest2);
  /*
    1
    2
    7
    [3, 4, 5, 6]
  */
  print('-----------');

  final minJiMap = {'name' : '민지', 'age' : 19};
  final {'name' : name3, 'age': age3} = minJiMap;
  
  print(name3);
  print(age3);
  /*
    민지
    19
  */
  print('-----------');

  final MinJiIdol = Idol(name: '민지', age: 19);
  final Idol(name: name4, age: age4) = MinJiIdol;

  print(name4);
  print(age4);
  /*
    민지
    19
  */
}

class Idol{
  final String name;
  final int age;

  Idol({
    required this.name,
    required this.age,
  });
}
```

### Pattern Matching - Validation & swich case

```dart
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
```

### 클래스 키워드 update

### final

- final 클래스를 선언하면 extends, implement, 또는 mixin으로 사용이 불가능하다.

```dart
void main(){
}

final class Person{
    final String name;
    final int age;

    Person({
        required this.name.
        required this.age,
    });
}

class Idol extends Person{} // 다른 파일에서 이 클래스 불러오기 불가능
```

### base

- base로 선언하면 extend는 가능하지만 implement는 불가능하다.
- base. sealed. final로 선언된 클래스만 extend가 가능하다.

```dart
void main(){
}

vase class Person{
    final String name;
    final int age;

    Person({
        required this.name.
        required this.age,
    });
}

base class Idol extends Person{}
```

### interface

- interface로 선언하면 implement만 가능하다.
```dart
interface class Person{
    final String name;
    final int age;

    Person({
        required this.name.
        required this.age,
    });
}

class Idol implements Person{} // 이것만 가능
```

### sealed

- sealed 클래스는 abstract이면서 final이다.
- 패턴매칭을 사용 할 수 있도록 해준다.

```dart
sealed class Person {}

class Idol extends Person {}

class Engineer extends Person {}

class Chef extends Person {}

String whoIsHe(Person person) => switch (person) {
    Idol i => '아이돌',
    Engineer e => '엔지니어',
    _ => '나머지를 의미',
};
```

### Mixin Class
- mixin은 extends나 with을 사용할 수 없다. 그렇기 때문에 mixin class도 마찬가지로 사용 불가능하다.
- 클래스는 on 키워드를 사용 할 수 없다. 그렇기 때문에 mixin class도 on 키워드를 사용할 수 없다.

```dart
mixin class AnimalMixin{
    String bark(){
        return '멍멍';
    }
}

class Dog with AnimalMixin{}
```