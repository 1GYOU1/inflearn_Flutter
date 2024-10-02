# [이론] FutureBuilder & StreamBuilder

FutureBuilder와 StreamBuilder의 실제 사용 차이

- 비동기 처리
- build 함수가 다시 호출되는 과정에서 UI가 자동으로 업데이트 된다.
- FutureBuilder: Future의 상태가 변경될 때마다 builder 함수를 다시 호출
  - 단일 결과를 기다리는 경우
- StreamBuilder: Stream에서 새 데이터가 발생할 때마다 builder 함수를 다시 호출
  - 지속적인 데이터 흐름을 처리해야 하는 경우

<br>

### FutureBuilder

강의 요약
1. Future의 상태를 볼 수 있는 기능 - ConnectionState
2. 데이터의 존재 유무에 따른 분기처리 하는 법
3. ConnectionState에 따른 분기처리

<br>

- Future의 상태를 볼 수 있는 기능 - ConnectionState
  - ConnectionState.none -> Future 또는 Stream이 입력되지 않은 상태
  - ConnectionState.active -> Stream에서만 존재 / 스트림 아직 실행중
  - ConnectionState.done -> Future 또는 Stream이 종료 됐을때
  - ConnectionState.waiting -> 실행중, FutureBuilder에서는 아직 실행이 완료가 안된 상태

<br>

전체 코드

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<int>(
        future: getNumber(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          print('--------data--------');
          print(snapshot.connectionState);
          print(snapshot.data);

          // 데이터를 기다리는 중인 경우
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          /// error 확인
          if (snapshot.hasError) {
            final error = snapshot.error;
            return Center(
              child: Text('에러: $error'),
            );
          }

          /// 데이터가 존재하는지 확인
          if (snapshot.hasData) {
            final data = snapshot.data;
            return Center(
              child: Text(data.toString()),
            );
          }

          // 데이터가 존재하지 않는 경우
          return Center(
            child: Text('데이터가 없습니다.'),
          );
        },
      ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));
    final random = Random();

    // throw '에러 발생 !!!!!!!';

    return random.nextInt(100);
  }
}

```

<br>

① snapshot.data의 타입 변환
- Future 또는 Stream을 반환해주는 타입을 FutureBuilder와 AsyncSnapshot의 타입을 맞춰주면 반환해주는 값의 타입이 자동으로 변환 된다.(하단 사진 : 원래 dynamic 타입이었지만 int 타입으로 변환)

![스크린샷 2024-10-01 오후 12 57 40](https://github.com/user-attachments/assets/d9f1f68a-56f2-4ad2-a09c-5ae080066dfe)

![스크린샷-2024-10-01-오후-1 01 30](https://github.com/user-attachments/assets/8a2b16b5-9e35-4c1b-9890-174e006dc57c)

<br>

➁ 코드를 실행하면 랜덤 숫자가 터미널에 출력되는데, Hotreload를 했을때, 이전 실행했던 데이터를 기억하고 있는 것을 볼 수 있다.(캐싱)

![스크린샷 2024-10-01 오후 3 07 34](https://github.com/user-attachments/assets/ac059f59-0a07-40b1-9dc3-d3b265078f4f)

<br>

➂ ConnectionState 활용 - ConnectionState.waiting일 때 Indicator 보여주기

```dart
// 데이터를 기다리는 중인 경우
if (snapshot.connectionState == ConnectionState.waiting) {
  return Center(
    child: CircularProgressIndicator(),
  );
}
```

![무제 (4)](https://github.com/user-attachments/assets/146f1a49-909e-40d5-90c7-dc01ec80e1fc)


<br>
<br>

### StreamBuilder

- 상단 코드에서 FutureBuilder를 StreamBuilder로 변경
- for문으로 0~9까지 1초마다 1씩 증가하는 데이터를 반환하는 스트림을 생성하는 코드로 수정

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>( // StreamBuilder로 변경
        stream: streamNumbers(), // Stream으로 변경
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          print('--------data--------');
          print(snapshot.connectionState);
          print(snapshot.data);

          if (snapshot.connectionState == ConnectionState.active) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text(snapshot.data.toString()),
                ],
              ),
            );
          }

          /// error 확인
          if (snapshot.hasError) {
            final error = snapshot.error;
            return Center(
              child: Text('에러: $error'),
            );
          }

          /// 데이터가 존재하는지 확인
          if (snapshot.hasData) {
            final data = snapshot.data;
            return Center(
              child: Text(data.toString()),
            );
          }

          // 데이터가 존재하지 않는 경우
          return Center(
            child: Text('데이터가 없습니다.'),
          );
        },
      ),
    );
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));

      // if (i == 5) {
      //   throw '에러 !!!!!!!';
      // }

      yield i;
    }
  }
}
```

- ConnectionState.active -> Stream에서만 존재 / 스트림 아직 실행중이라는 뜻
- 하단 코드는 스트림 아직 실행중일때 인디케이터를 가운데 정렬하여 보여주는 코드

```dart
if (snapshot.connectionState == ConnectionState.active) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        Text(snapshot.data.toString()),
      ],
    ),
  );
}
```

<br>

- 실행전(스트림이 생성되고 연결된 직후, 첫 데이터가 도착하기 전에 발생) - waiting
- 실행중 - active
- 실행 후 - done

![스크린샷 2024-10-01 오후 3 50 11](https://github.com/user-attachments/assets/d788c66b-4f4f-446b-857f-28bbabb8e0d8)

![5-ezgif com-speed](https://github.com/user-attachments/assets/1e9a131c-eb68-4b20-9963-6771d9baa3a8)

<br>

- 에러 발생시

![스크린샷 2024-10-01 오후 3 53 09](https://github.com/user-attachments/assets/30395908-a020-4a01-accb-30057fdfcc04)

![_1-ezgif com-speed](https://github.com/user-attachments/assets/e789e6af-5497-446e-b8d7-398f69be22e2)

<br>
<br>

### 결론

- FutureBuilder와 StreamBuilder의 ConnectionState는 active, waiting에 따라 차이가 있다는 것 빼고는 동일하다.
- 데이터의 존재 유무, ConnectionState 상태에 따른 분기처리가 가능하다.