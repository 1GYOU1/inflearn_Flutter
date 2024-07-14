# Dart #4 비동기 프로그래밍 (Async Programming)

### 동기 프로그래밍 (synchronous programming)

```dart
void main() {
  addNumbers(1, 1);
  addNumbers(2, 2);
}
// 1 + 1 = 2
// 2 + 2 = 4
void addNumbers(int number1, int number2){
  print('계산중: $number1 + $number2');
  print('계산 완료: ${number1 + number2}');

  /*
    계산중: 1 + 1
    계산 완료: 2
    계산중: 2 + 2
    계산 완료: 4
  */
}
```

<br>

### Future

- 미래에 받아올 값을 의미한다.
- delayed
- async await

<br>

### Future - delayed

- 딜레이를 줘서 지연시키기

사용법

```dart
Future.delayed(Duration(지연할 시간), (){
});
```

```dart
void main() {
  // Future - 미래
  // 미래에 받아올 값
  Future<String> name = Future.value('규원');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  addNumbers(1, 1);
  addNumbers(2, 2);
}

void addNumbers(int number1, int number2){
  print('계산 시작 : $number1 + $number2');

  // 서버 시뮬레이션
  Future.delayed(Duration(seconds: 2), (){ // 2초 후 딜레이 끝
    print('계산 완료: $number1 + $number2 = ${number1 + number2}');
  });

  print('함수 완료');

  /*
    계산 시작 : 1 + 1
    함수 완료
    계산 시작 : 2 + 2
    함수 완료
    
  2초 뒤 실행
  -> 계산 완료: 1 + 1 = 2
  -> 계산 완료: 2 + 2 = 4
  */
}
```

<br>

### Future - async await

- await 다음에 순차적으로 실행하기로 한 코드

```dart
void main() async{
  // Future - 미래
  // 미래에 받아올 값
  Future<String> name = Future.value('규원');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  final result1 = await addNumbers(1, 1);
  final result2 = await addNumbers(2, 2);

  print('result1: $result1');
  print('result2: $result2');
  print('result1 + result2 = ${result1 + result2}');
}

Future<int> addNumbers(int number1, int number2) async {
  print('계산 시작 : $number1 + $number2');

  // 서버 시뮬레이션
  await Future.delayed(Duration(seconds: 2),(){
    print('계산 완료 : $number1 + $number2 = ${number1 + number2}');
  });

  print('함수 완료 : $number1 + $number2');

  return number1 + number2;
}

/*
  계산 시작 : 1 + 1
  계산 완료 : 1 + 1 = 2
  함수 완료 : 1 + 1
  계산 시작 : 2 + 2
  계산 완료 : 2 + 2 = 4
  함수 완료 : 2 + 2
  result1: 2
  result2: 4
  result1 + result2 = 6
*/
```

<br>

### Stream

- 무한으로 값을 받아낼 수 있으며, yield라는 키워드로 완료 순간을 지정한다.
- 지속적으로 값을 받아낼 수 있다는 장점이 있다.
- dart 언어에서 기본적으로 제공해주는 기능이 아니기 떄문에, 패키지를 불러온 뒤 사용 가능.

기본 예시
```dart
import 'dart:async';
void main() async{
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.listen((val){
    print('Listener 1 : $val');
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);

  /*
    Listener 1 : 1
    Listener 1 : 2
    Listener 1 : 3
    Listener 1 : 4
    Listener 1 : 5
  */
}
```

```dart
import 'dart:async';
void main() async{
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  // 찍수
  final streamListener1 = stream.where((val) => val % 2 == 0).listen((val){
    print('Listener 1 : $val');
  });
  // 홀수
  final streamListener2 = stream.where((val) => val % 2 == 1).listen((val){
    print('Listener 2 : $val');
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);

  /* 번갈아 가면서 리스닝
    Listener 2 : 1
    Listener 1 : 2
    Listener 2 : 3
    Listener 1 : 4
    Listener 2 : 5
  */
}
```

calculate 예시

- Stream 에서는 async에 * 붙여서 `async*`로 사용

```dart
import 'dart:async';
void main() async{
  playAllStream().listen((val){
    print(val);
  });
}

Stream<int> playAllStream()async*{
  yield* calculate(1);
  yield* calculate(1000);
}

Stream<int> calculate(int number) async* {
  for(int i = 0; i < 5; i++){
    yield i * number;

    await Future.delayed(Duration(seconds: 1));
  }
}

/*
  0
  1
  2
  3
  4
  0
  1000
  2000
  3000
  4000
*/
```