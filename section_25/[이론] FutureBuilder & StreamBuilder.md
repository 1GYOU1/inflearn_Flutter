# [이론] FutureBuilder & StreamBuilder

### FutureBuilder

- ConnectionState.none -> Future 또는 Stream이 입력되지 않은 상태
- ConnectionState.active -> Stream에서만 존재 / 스트림 아직 실행중
- ConnectionState.done -> Future 또는 Stream이 종료 됐을때
- ConnectionState.waiting -> 실행중

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<int>(
        future: getNumber(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          print('--------data--------');
          print(snapshot.connectionState);
          print(snapshot.data);

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

    throw '에러 발생 !!!!!!!';

    return random.nextInt(100);
  }
}
```

<br>
<br>

### StreamBuilder

```dart
```