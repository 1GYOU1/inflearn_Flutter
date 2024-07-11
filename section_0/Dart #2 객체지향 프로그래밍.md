## 객체지향 프로그래밍의 정의

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

```dart

```