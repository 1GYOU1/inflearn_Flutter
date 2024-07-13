# Dart #2 객체지향 프로그래밍 (Object Oriented Programming)

### 객체지향 프로그래밍의 정의

- 영어로는 OOP (Object Oriented Programming)
- 클래스를 설계(프로그래밍)하는 것이 클래스의 정의이다.
- 클래스를 이용하여 결과물을 만드는 것은 인스턴스이다.

![스크린샷 2024-07-10 오후 2 45 34](https://github.com/1GYOU1/inflearn_Flutter/assets/90018379/7eec682c-7e8f-4d3c-99ad-ed54ee4e2f08)

### 클래스 선언

- 기본 constructor - positional parameter
- named constructor
    - named parameter와 비슷한 성격을 지니고 있다.
- 기본 construcor와 named constructor 둘 중에 하나 골라서 construcor 사용하면 됨.
- 변수값 변경 방지를 위해 final, const 적절히 사용
    - const는 빌드 당시의 값을 알고 있어야함.
    - 내용 값이 같은 인스턴스(blackPink, blackPink2)에 const를 붙이지 않으면 값이 같아도 false로 나옴.
- getter와 setter
    - getter
        - 데이터를 가져올 때 사용
        - 중괄호만 사용
    - setter
        - 데이터를 새로운 값으로 설정할 때 사용 → 많이 사용 안함.
- private 변수
    - class _Idol 이런식(underscore)으로 선언하고, 
    외부 파일에서 import해서 사용할 때, _idol 클래스를 사용할 수 없게 됨.
    - 함수, 변수에도 사용 가능

```dart
void main(){
  Idol blackPink = const Idol(
    'group1',
    ['a', 'b', 'c', 'd'],
  );

  print(blackPink.name);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.introduce();
  /*
    group1
    [a, b, c, d]
    안녕하세요 group1입니다.
    저희는 [a, b, c, d]로 구성되어있습니다.
  */
  
  // getter 코드 출력
  print(blackPink.firstMember);// a
  
  Idol blackPink2 = const Idol(
    'group1',
    ['a', 'b', 'c', 'd'],
  );
  
  print(blackPink == blackPink2); // true
  // 인스턴스(blackPink, blackPink2)에 const를 붙이지 않으면 값이 같아도 false로 나옴.

  Idol bts = Idol.fromList(
    [
      ['aa', 'bb', 'cc', 'dd', 'ee', 'ff', 'gg'],
      'group2',  
    ]
  );
  print(bts.name);
  print(bts.members);
  bts.sayHello();
  bts.introduce();
  /*
    group2
    [aa, bb, cc, dd, ee, ff, gg]
    안녕하세요 group2입니다.
    저희는 [aa, bb, cc, dd, ee, ff, gg]로 구성되어있습니다.
  */
}

// Idol calss
// name (이름) - 변수
// members (멤버들) - 변수
// sayHello (인사) - 함수
// introduce (멤버소개) - 함수

// constructor (생성자)

class Idol{
  final String name;
  final List<String> members;
  
  const Idol(this.name, this.members); // 기본 constructor

  Idol.fromList(List values) // named constructor
    : this.members = values[0],
      this.name = values[1];

  void sayHello(){
    print('안녕하세요 ${this.name}입니다.');
  }
  void introduce(){
    print('저희는 ${this.members}로 구성되어있습니다.');
  }
  
  // getter
  String get firstMember{
	  return this.members[0];
  }
}
```

### Inheritance (상속)

- 상속을 받으면 부모 클래스의 모든 속성을 자식 클래스가 부여 받는다.
- 자식 클래스의 속성들은 부모 클래스로 넘어가지 않는다.
- 같은 자식 클래스 끼리도 속성들을 공유하지 않는다. 부모 클래스의 속성들을 받기만 함.

```dart
void main(){
  print('------- Idol --------');
  Idol group1 = Idol(name : '그룹 1', membersCount: 5);

  group1.sayName();
  group1.sayMembersCount();
  /*
    ------- Idol --------
    저는 그룹 1입니다.
    그룹 1은 5명의 멤버가 있습니다.
  */
  print('------- Boy Group --------');
  BoyGroup bts = BoyGroup('BTS', 7);

  bts.sayName();
  bts.sayMembersCount();
  bts.sayMale();
  /*
    ------- Boy Group --------
    저는 BTS입니다.
    BTS은 7명의 멤버가 있습니다.
    남자 아이돌 입니다.
  */
  
  print('------- Girl Group --------');
  GirlGroup redVelvet = GirlGroup('Red Velvet', 5);

  redVelvet.sayName();
  redVelvet.sayMembersCount();
  redVelvet.sayFemale();
  /*
    ------- Girl Group --------
    저는 Red Velvet입니다.
    Red Velvet은 5명의 멤버가 있습니다.
    여자 아이돌 입니다.
  */

  // 부모는 자식 클래스가 될 수 없다.
  print('------- Type Comparision --------');
  print(group1 is Idol); // true
  print(group1 is BoyGroup); // false
  print(group1 is GirlGroup); // false

  print('------- Type Comparision 2 --------');
  print(bts is Idol); // true
  print(bts is BoyGroup); // true
  print(bts is GirlGroup); // false

  print('------- Type Comparision 3 --------');
  print(redVelvet is Idol); // true
  print(redVelvet is BoyGroup); // false
  print(redVelvet is GirlGroup); // true

}

// 상속 - inheritance
// 상속을 받으면 부모 클래스의 모든 속성을 자식 클래스가 부여받는다.
class Idol{
  //이름
  String name;
  // 멤버 숫자
  int membersCount;

  Idol({
    required this.name,
    required this.membersCount,
  });

  void sayName(){
    print('저는 ${this.name}입니다.');
  }

  void sayMembersCount(){
    print('${this.name}은 ${this.membersCount}명의 멤버가 있습니다.');
  }
}

class BoyGroup extends Idol{
  BoyGroup(
    String name,
    int membersCount,
  ) : super(
    name : name,
    membersCount: membersCount,
  );

  void sayMale(){
    print('남자 아이돌 입니다.');
  }
}

class GirlGroup extends Idol{
  GirlGroup(
    String name,
    int membersCount,
  ) : super(
    name : name,
    membersCount: membersCount,
  );

  void sayFemale(){
    print('여자 아이돌 입니다.');
  }
}
```

### method overriding

`@override`

- 오버라이드를 사용하면 method를 덮어 씌울 수 있다.
- 오버라이드를 한 상태에서 `super` 키워드를 사용해 속성이나 method를 가져올 수 있다.

```dart
void main(){
  TimeTwo tt = TimeTwo(2);

  print(tt.calculate()); // 4

  TimeFour tf = TimeFour(2);

  print(tf.calculate()); // 8
}

// method - function (class 내부에 있는 함수)
// override - 덮어쓰다 (우선시하다)
class TimeTwo{
  final int number;

  TimeTwo(
    this.number,
  );

  // method
  int calculate(){
    return number * 2;
  }
}

class TimeFour extends TimeTwo{
  TimeFour(
    int number,
  ) : super(number);

  @override
  int calculate(){
    return number * 4;
    // 하단 처럼도 작성 가능.
    // return this.number & 4;
    // return super.number * 4;

    // 부모의 calculate 상속으로 사용
    // return super.calculate() * 2
  }
}
```

### static

- static은 instance에 귀속되지 않고 class에 귀속된다.
- static keyword를 사용해서 변수를 클래스에 귀속시킬 수 있다.

```dart
void main(){
  Employee seulgi = Employee('슬기');
  Employee chorong = Employee('초롱');
  Employee jenny = Employee('제니');

  // instance를 만든 다음 실행(instance에 귀속)
  seulgi.name = 'gyou1';

  seulgi.printNameAndBuilding(); // 제 이름은 gyou1입니다. null 건물에서 근무하고 있습니다.
  chorong.printNameAndBuilding(); // 제 이름은 초롱입니다. null 건물에서 근무하고 있습니다.

  // class 실행하거나 값을 바꾸기(class에 귀속)
  Employee.building = '규원마을';
  
  seulgi.printNameAndBuilding(); // 제 이름은 gyou1입니다. 규원마을 건물에서 근무하고 있습니다.
  chorong.printNameAndBuilding(); // 제 이름은 초롱입니다. 규원마을 건물에서 근무하고 있습니다.
  jenny.printNameAndBuilding(); // 제 이름은 제니입니다. 규원마을 건물에서 근무하고 있습니다.

  // static method
  Employee.printBuilding(); // 저희는 규원마을 건물에서 근무중입니다.
}

class Employee {
  // static은 instance에 귀속되지 않고 class에 귀속된다.
  // 알바생이 일하고 있는 건물
  static String? building;
  // 알바생 이름
  String name;

  Employee(
    this.name,
  );

  void printNameAndBuilding(){
    print('제 이름은 $name입니다. $building 건물에서 근무하고 있습니다.');
  }

  static void printBuilding(){
    print('저희는 $building 건물에서 근무중입니다.');
  }
}
```

### interface

- 선언되어 있는 형태(구조)를 강제적으로 지킬 수 있도록 함.
- dart에서의 interface는 interface라는 키워드를 사용하지 않고, class를 사용한다.
- 다른 개발자들과 서로 소통을 할 필요 없이, 해당 인터페이스를 사용해야 한다고 정의해 놓았을 경우, 어떤 값들을 클래스에 지정해 놔야하는지 쉽게 알 수 있음.
- `abstract` - instance로 사용하지 말라는 의미.

```dart
void main(){
  BoyGroup bts = BoyGroup('BTS');
  GirlGroup redVelvet = GirlGroup('레드벨벳');

  bts.sayName(); // 제 이름은 BTS입니다.
  redVelvet.sayName(); // 제 이름은 레드벨벳입니다.

  print(bts is IdolInterface); // true
  print(bts is BoyGroup); // true
  print(bts is GirlGroup); // false

  print(redVelvet is IdolInterface); // true
  print(redVelvet is BoyGroup); // false
  print(redVelvet is GirlGroup); // true
}
// interface
abstract class IdolInterface{
  String name;
  IdolInterface(this.name);
  void sayName(){}
}

class BoyGroup implements IdolInterface{
  String name;
  BoyGroup(this.name);
  void sayName(){
    print('제 이름은 $name입니다.');
  }
}

class GirlGroup implements IdolInterface{
  String name;
  GirlGroup(this.name);
  void sayName(){
    print('제 이름은 $name입니다.');
  }
}
```

### generic

- 타입을 외부에서 받을때 사용한다.

```dart
void main(){
  Lecture<String, String> lecture1 = Lecture('123', 'abc');

  lecture1.printIdType(); // String

  Lecture<int, String> lecture2 = Lecture(4567, 'def');

  lecture2.printIdType(); // int
}

// generic - 타입을 외부에서 받을때 사용
class Lecture<T, X> { // -> 아무 이름 지으면 됨.
  final T id;
  final X name;

  Lecture(this.id, this.name);

  void printIdType(){
    print(id.runtimeType);
  }
}
```