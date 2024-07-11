# Dart #1 기본기 - 93분

코드는 위에서부터 아래로 실행된다.

같은 스코프 안에서 똑같은 이름의 변수 선언 X

semicolon은 한 줄이 끝날 때마다 꼭 작성해야함.

### var

- 자동으로 타입 유추해서 변수 선언을 도와줌.
- `runtimeType` - 변수의 값이 실행되는 순간에 어떤 타입인지 알려줌.

```dart
void main(){
	var name3 = "이름3";
	var num = 20;
	
	print(name3);//"이름3"
	print(num);// 20;
	print(name3.runtimeType);//string
}
```

### dynamic

- var은 최초에 할당한 타입으로만 변경 가능
- dynamic은 변수 할당 타입 상관없이 무제한

```dart
void main(){
	dynamic name = "abc";
	name = 2;// 타입 변경 가능
	
	var name2 = "def";
	name2 = "ddd";// 타입 변경 불가능
}
```

### int

- 정수의 타입

```dart
void main(){
//integer
	int number1 = 10;
	
	print(number1); // 10
}
```

### double

- 실수의 타입

```dart
void main(){
	double number1 = 2.5;
	double number2 = 0.5;
	
	print(number1 + number2); // 6
}
```

### Boolean

```dart
void main(){
	bool isTrue = true;
	bool isFalse = false;
	
	print(isTrue);//true
	print(isFalse);//false
}
```

### String

- 문자열도 더하기를 할 수 있다.

```dart
void main(){
	String name = "문자열";
	String name2 = "문자열2";
	
	print(name);// 문자열
	print(name + ' '+ name2) // 문자열 문자열2
	print('${name} ${name2}') // 문자열 문자열2
	
	// 변수 하나만 쓰는 경우에는 {} 중괄호 생략 가능
	print('$name $name2') // 문자열 문자열2
}
```

## nullable, non-nullable

### null

- 아무런 값도 있지 않다.

### nullable

- null이 될 수 있다.
- 타입에 물음표 `?` 달아서 사용

```dart
void main(){
	String? name = "이름";
	name = null;
}
```

### non-nullable

- null이 될 수 없다.
- null 값이 절대 될 수 없다. → 느낌표 `!`

```dart
void main(){
	String name = "이름";
	print(name!); // null 값이 아니라서 warning(현재 null 값이 아니다를 의미)
}
```

### Final

- 빌드 타임의 값을 몰라도 사용 가능.
    - 빌드 타임 - 코드를 작성하는 순간에 코드의 값을 알고 있어야 하는 것.
    - DateTime.now();는 코드가 실행되는 순간에 시간을 가져옴.
- 타입을 생략하여 작성 가능.

```dart
void main(){
	final String name = "이름";
	final name = "이름"; // 타입 생략하여 작성 가능
	
	final DateTime now = DateTime.now();
}
```

### const

- 빌드 타임의 값을 알아야 사용 가능.
- 타입을 생략하여 작성 가능

```dart
void main(){
	const String name = "이름";
	const name = "이름"; // 타입 생략하여 작성 가능
	
	const DateTime now = DateTime.now(); // 사용 불가능.
}
```

## Operator

### 연산

```dart
void main(){
	double number = 4.0;
	print(number);//4
	number += 1;
	print(number);//5
	number -= 1;
	print(number);//4
	number *= 2;
	print(number);//8
	number /= 2;
}
```

### ??=

- null일 때 오른쪽 값으로 바꿔줌.

```dart
void main(){
	double? number = 4.0;
	number = null;
	print(number);//null
	number ??= 3.0;
	print(number);//3
}
```

### 값 비교

```dart
void main(){
	int number1 = 1;
	int number2 = 2;
	
	print(number1 > number2);//false
	print(number1 < number2);//true
	print(number1 >= number2);//false
	print(number1 <= number2);//true
	print(number1 == number2);//false
	print(number1 != number2);//true
}
```

### 타입 비교

```dart
void main(){
	int number1 = 1;
	
	print(number1 is int);//true
	print(number1 is String);//false
	
	print(number1 is! int);//false
	print(number1 is! String);//true
}
```

### 논리 Operator

- && - and 조건
- || - or 조건

```dart
void main(){
	bool result = 12 > 10 && 1 > 0 && 3 > 0;
	print(result); // true
	
	bool result2 = 12 > 10 && 0 > 1;
	print(result2); // false
	
	bool result3 = 12 > 10 || 1 > 0;
	print(result3); // true
	
	bool result4 = 12 > 10 || 1 > 0;
	print(result4); // true
	
	bool result5 = 12 < 10 || 1 > 0;
	print(result5); // false
}
```

### list

- `add` 원하는 배열 원소 더하기
- `remove` 원하는 배열 원소 지우기
- `indexOf` 원하는 배열 원소의 index 값 구하기
- `length` 원하는 배열 원소의 길이 구하기

```dart
void main(){
	List<string> name = ['a', 'b', 'c'];
	List<string> name2 = [1, 2, 3];
	
	print(name);// [a, b, c]
	print(name2);// [1, 2, 3]
	print(name[0]);// a
	print(name.length);// 3
	
	name.add('d');
	print(name);// [a, b, c, d];
	
	name.remove('c');
	print(name);// [a, b, d];
	
	print(name.indexOf('c'));// 2
}
```

### Map

- key와 value가 짝을 이루는 값으로 이루어져 있음.
- key를 이용하여 value 값을 찾는데 사용
- `addAll` - Map 추가하기

```dart
void main(){
// Map
// Key : Value
	Map<String, String> dictionary = {
		"Harry Potter" : "해리포터",
		"Ron Weasley" : "론 위즐리",
		"Hermione Granger" : "헤르미온느 그레인저",
	};
	print(dictionary);
	// {Harry Potter: 해리포터, Ron Weasley: 론 위즐리, Hermione Granger: 헤르미온느 그레인저}
	
	Map<String, bool> isHarryPotter = {
		"Harry Potter" : true,
		"Ron Weasley" : true,
		"Ironman" : false,
	};
	
	// Map 추가
	isHarryPotter.addAll({
		"Spiderman" : false,
	});
	print(isHarryPotter);
	// {Harry Potter: true, Ron Weasley: true, Ironman: false, Spiderman: false}
	
	// Map 추가 2
	isHarryPotter["Hulk"] = false;
	print(isHarryPotter);
	// {Harry Potter: true, Ron Weasley: true, Ironman: false, Spiderman: false, Hulk: false}

	// Map value 값 바꾸기
	isHarryPotter["Spiderman"] = true;
	print(isHarryPotter);
	// {Harry Potter: true, Ron Weasley: true, Ironman: false, Spiderman: true, Hulk: false}
	
	// value 값 가져오기
	print(isHarryPotter["Ron Weasley"]) // true

}
```

- `remove` - Map 제거하기

```dart
void main(){
// Map
// Key : Value
	Map<String, bool> isHarryPotter = {
		"Harry Potter" : true,
		"Ron Weasley" : true,
		"Ironman" : false,
	};
	
	// Map 제거하기
	isHarryPotter.remove("Harry Potter");
	print(isHarryPotter);
	// {Ron Weasley: true, Ironman: false}
}
```

- `keys` - key값만 가져오기

```dart
void main(){
// Map
// Key : Value
	Map<String, bool> isHarryPotter = {
		"Harry Potter" : true,
		"Ron Weasley" : true,
		"Ironman" : false,
	};
	
	// Map key값만 가져오기
	print(isHarryPotter.keys);
	// (Harry Potter, Ron Weasley, Ironman)
}
```

- `values` - value 값만 가져오기

```dart
void main(){
// Map
// Key : Value
	Map<String, bool> isHarryPotter = {
		"Harry Potter" : true,
		"Ron Weasley" : true,
		"Ironman" : false,
	};
	
	// Map value값만 가져오기
	print(isHarryPotter.values);
	// (true, true, false)
}
```

### Set

- list는 중복 값이 들어갈 수 있으나, set은 중복값 사용 불가능하여 중복을 자동으로 처리해준다는 장점이 있음.
- list와 비슷한 함수가 많음 `remove` `add` 등…

```dart
void main(){
  // Set
  final Set<String> names = {
    'abc',
    'def',
    'pink',
  };

  print(names); // {abc, def, pink}
  names.add('gyou1');
  print(names); // {abc, def, pink, gyou1}
  names.add('gyou1'); // 같은 값 두번 추가했지만 Set이라서 한번만 출력함
  print(names); // {abc, def, pink, gyou1}
  names.remove('pink');
  print(names); // {abc, def, gyou1}
  print(names.contains('gyou1')); // true
}
```

### if

- 조건이 걸리는 곳에서 실행 종료.

```dart
void main(){
  // if문

  int number = 3;
  if (number % 3 == 0){
    print('나머지가 0입니다.'); // 나머지가 0입니다.
  }else if(number % 3 == 1){
    print('나머지가 1입니다.');
  }else{
    print('나머지가 2입니다.');
  }
}
```

### switch

- break를 걸어줘야 조건이 걸리는 곳에서 실행이 끝남.

```dart
void main(){
  // swith문

  int number = 3;

  switch(number % 3){
    case 0:
    print('나머지가 0입니다.');
    break;

    case 1:
    print('나머지가 1입니다.');
    break;

    default: // else와 같은 역할, 기본 값
    print('나머지가 2입니다.');
    break;
  }
}
```

### For

```dart
void main(){
  // for문
  for(int i=0;i<10;i++){
    print(i);
    /*
    0
    1
    2
    3
    4
    5
    6
    7
    8
    9
    */
  }
}
```

```dart
void main(){
  // for loop
  int total = 0;

  List<int> numbers = [1, 2, 3, 4, 5, 6];

  for(int i=0;i<numbers.length;i++){
    total += numbers[i];
  }
  print(total);// 21
}
```

```dart
void main(){
  // for loop
  int total = 0;

  List<int> numbers = [1, 2, 3, 4, 5, 6];

  for(int number in numbers){
    total += number;
  }

  print(total);// 21
}
```

### while

```dart
void main(){
  // while loop
  
  int total = 0;
  while(total < 10){
    total += 1;
  }
  print(total);
  total = 0;
}
```

### while & for 문에서의 if break 사용 예제

```dart
void main(){
  // while break;
  int total = 0;
  while(total < 10){
    total += 1;
    if(total == 5){
      break;
    }
  }
  print(total); // 5

  // for break;
  for(int i=0;i<10;i++){
    if(i == 5){
      break;
    }
  print(i);
  /*
  0
  1
  2
  3
  4
  */
  }
}
```

### for문에서의 continue

- 조건에 성립할 때 continue 하단 코드는 생략하고 다음 실행

```dart
void main(){
  // for continue

  for(int i=0;i<10;i++){
    if(i == 5){
      print('test');
      continue;
    }
    print(i);
    /*
    0
    1
    2
    3
    4
    test
    6
    7
    8
    9
    */
  }
}
```

### enum

- 정해진 타입을 사용하여 사용자의 실수(오타 등..)를 방지
- 자동 완성 기능 사용 가능

```dart
enum Status{
  approved,// 승인
  pending,// 대기
  rejected,// 거절
}
void main(){
  Status status = Status.approved;

  if(status == Status.approved){
    print('승인');
  }else if(status == Status.pending){
    print('대기');
  }else{
    print('거절');
  }
}
```

### 함수 사용법

### 기본

```dart
void main(){
  addNumbers();  
  /*
  x : 20
  y : 30
  z : 10
  짝수
  */
}

addNumbers(){
  int x = 20;
  int y = 30;
  int z = 10;

  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if(sum % 2 == 0){
    print('짝수');
  }else{
    print('홀수');
  }
}
```

## parameter(argument)

- 매개변수 기본 사용법

```dart
void main(){
  addNumbers(20, 30, 10);  
  /*
  x : 20
  y : 30
  z : 10
  짝수
  */
}

addNumbers(int x, int y, int z){

  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if(sum % 2 == 0){
    print('짝수');
  }else{
    print('홀수');
  }
}
```

### positional parameter

- 파라미터 작성 순서 중요

```dart
void main(){
  addNumbers(20, 30, 10);  
  /*
  x : 20
  y : 30
  z : 10
  짝수
  */
}

addNumbers(int x, int y, int z){

  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if(sum % 2 == 0){
    print('짝수');
  }else{
    print('홀수');
  }
}
```

### optional parameter

- 있어도 되고 없어도 되는 파라미터.
- 기본 값 설정해주어 값이 없을 때 기본 값을 출력

```dart
void main(){
  addNumbers(20); 
  /*
  x : 20
  y : 0
  z : 0
  짝수
  */
  addNumbers(20, 30, 10);  
  /*
  x : 20
  y : 30
  z : 10
  짝수
  */
}

addNumbers(int x, [int y = 0, int z = 0]){ // 대괄호 사용, 기본 값 지정

  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if(sum % 2 == 0){
    print('짝수');
  }else{
    print('홀수');
  }
}
```

### named parameter

- 이름을 정해주어 작성 순서가 중요하지 않음

```dart
void main(){
  addNumbers(y: 30, x: 20, z:10);  
  /*
  x : 20
  y : 30
  z : 10
  짝수
  */
}

addNumbers({
  required int x,
  required int y,
  required int z,
}){

  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if(sum % 2 == 0){
    print('짝수');
  }else{
    print('홀수');
  }
}
```

### named parameter + optional parameter

- 작성 순서에 관계없도록 이름을 지정하여 사용하고, 기본 값 정해주기

```dart
void main(){
  addNumbers(y: 1, x: 2); 
  /*
  x : 2
  y : 1
  z : 10
  홀수
  */
  addNumbers(y: 30, x: 20, z:10);  
  /*
  x : 20
  y : 30
  z : 10
  짝수
  */
}

addNumbers({
  required int x,
  required int y,
  int z = 10,
}){

  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if(sum % 2 == 0){
    print('짝수');
  }else{
    print('홀수');
  }
}
```

### void

- return 타입이 아무것도 없다는 뜻.
- 하단 코드는 함수에 타입을 선언하여 계산을 반환하는 코드이다.

```dart
void main(){
  int result = addNumbers(x: 10, y: 20);
  int result2 = addNumbers(x: 1, y: 2, z: 3);

  print('result : $result');
  /*
    x : 10
    y : 20
    z : 10
    짝수
  */
  print('result2 : $result2');
  /*
    x : 1
    y : 2
    z : 3
    짝수
  */
  print('sum : ${result + result2}');
  /*
    result : 40
    result2 : 6
    sum : 46
  */
}

int addNumbers({ // 함수에 타입 선언
  required int x,
  required int y,
  int z = 10,
}){

  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if(sum % 2 == 0){
    print('짝수');
  }else{
    print('홀수');
  }

  return sum;
}
```

### parameter 조합

- positional parameter + optional parameter
    - 중괄호 밖 positional + 중괄호 안 optional

```dart
void main(){
  int result = addNumbers(10, y: 20);
  int result2 = addNumbers(1, y: 2, z: 3);

  print('result : $result');
  /*
    x : 10
    y : 20
    z : 10
    짝수
  */
  print('result2 : $result2');
  /*
    x : 1
    y : 2
    z : 3
    짝수
  */
  print('sum : ${result + result2}');
  /*
    result : 40
    result2 : 6
    sum : 46
  */
}

int addNumbers(int x,{//positional patameter
  required int y,//optional parameter
  int z = 10,
}){

  int sum = x + y + z;

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if(sum % 2 == 0){
    print('짝수');
  }else{
    print('홀수');
  }

  return sum;
}
```

### arrow 함수

- 화살표 다음에 오는 값이 반환되는 값임.

화살표 함수 사용 전

```dart
void main(){
  int result = addNumbers(10, y: 20);
  int result2 = addNumbers(1, y: 2, z: 3);

  print('result : $result');
  print('result2 : $result2');
  print('sum : ${result + result2}');
}

int addNumbers(int x,{
  required int y,
  int z = 10,
}){ // 일반 함수 사용
  int sum = x + y + z;
  return sum;
}
```

화살표 함수 사용

```dart
void main(){
  int result = addNumbers(10, y: 20);
  int result2 = addNumbers(1, y: 2, z: 3);

  print('result : $result');
  print('result2 : $result2');
  print('sum : ${result + result2}');
}

int addNumbers(int x,{
  required int y,
  int z = 10,
}) => x + y + z; // 화살표 함수 사용, 반환값
```

### typeDef

- 함수 형태들을 선언할 수 있게 해줌.

```dart
void main(){
  Operation operation = add;
  int result = operation(10, 20, 30); // add 함수 실행
  print(result); // 60

  operation = subtract;
  int result2 = operation(10, 20, 30); // subtract 함수 실행
  print(result2); // -40
  
  int result3 = calculate(30, 40, 50, add); // calculate add 함수 실행
  print(result3); // 120

  int result4 = calculate(40, 50, 60, subtract); // calculate subtract 함수 실행
  print(result4); // -70
}

// signature
typedef Operation = int Function(int x, int y, int z);

// 더하기
int add(int x, int y, int z) => x + y + z;

// 빼기
int subtract(int x, int y, int z) => x - y - z;

// 계산
int calculate(int x, int y, int z, Operation operation){
  return operation(x, y, z);
}

```