# [프로젝트] [★☆☆☆☆] Image Carousel (전자액자)

### 프로젝트 목표 주요 포인트
- 이미지 사용법
- PageView 사용법
- Timer 사용법
- map() 함수 실전
- initState(), dispose() 실전
- 상태바 테마 변경

<br>

### Timer 이론

- **Timer**는 지정한 시간이 지난 뒤 한번 또는 주기적으로 무언가를 실행 할 수 있게 해준다.
- **Timer**는 pubspec.yaml에다가 추가를 따로 하지 않아도 플러터에 기본 제공되는 dart:async 패키지를 간단하게 불러오면 사용할 수 있다.

<br>

### 1) Timer 단일 실행

![Untitled-1](https://github.com/user-attachments/assets/7fd0b17a-f466-42fe-96f4-bba0f7d37fde)

```dart
import 'dart:async';

void main(){
  Timer(
    Duration(시, 분, 초: 숫자), // 기간
    (){
        함수; // 동작할 함수
    },
  );
}
``` 

<br>

실습

![Untitled-1](https://github.com/user-attachments/assets/bfd9cc01-3a0b-43c2-97e2-c830429ac826)

<br>

### 2) Timer 반복 실행

- 반복 실행은, 타이머 값이 파라미터 안에 우리가 실행할 때 사용했던 인스턴스를 그대로 반환해준다.
- 반복 실행을 timer.cancle 이라는 함수를 실행해줘서 취소할 수 있다.
- 단일 실행과의 한 가지 차이점은 타이머 클래스에 .periodic 이라는 생성자(네임드 생성자)를 사용해야한다.

![Untitled-1](https://github.com/user-attachments/assets/2aa21fa1-b1da-43d1-87d3-5d1975d44768)

<br>

실습

![Untitled-1](https://github.com/user-attachments/assets/c5a20393-a3b4-4192-b084-05a4a966033a)

++) **timer.cancle** 사용

![Untitled-1](https://github.com/user-attachments/assets/593fe9f1-a4cd-40eb-b9b0-419d5f7474c7)

<br>
<br>

### 프로젝트 초기화 및 이미지 화면에 렌더링하기

1. 이미지 폴더 생성, 이미지 가져오기 
  - 강의자료와 동일하도록 asset/img/폴더 안에 이미지 등록하기

2. main.dart, home_screen.dart 파일 초기화 작업

```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:image_carousel/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home:HomeScreen(),
    ),
  );
}
```

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          'asset/img/image_1.jpeg' // 이미지 불러오기
        ),
      ),
    );
  }
}
```

<br>

3. pubspec.yaml 이미지 주소 등록하기

```yaml
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  assets: # 이미지 주소 등록
    - asset/img/
```

<br>

결과 이미지

<img width="756" alt="스크린샷 2024-08-23 오후 11 31 29" src="https://github.com/user-attachments/assets/ae6e1607-db23-46b0-8ac5-eadccabc5101">

<br>
<br>

### PageView 사용해보기

- 좌우로 슬라이드 할 수 있는 기능 PageView 사용해보기

기본 비율 유지 가운데 정렬인 이미지 슬라이드 형식

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          children: [1, 2, 3, 4, 5].map((e) =>
              Image.asset(
                  'asset/img/image_$e.jpeg'
              ),
          ).toList(),
        )
      ),
    );
  }
}
```

<img width="756" alt="스크린샷 2024-08-24 오후 10 28 02" src="https://github.com/user-attachments/assets/3013bdc0-33b5-464f-a76f-18e34d456e0b">

<br>

기본 비율 유지하면서 전체화면 꽉차게 이미지 슬라이드 만들기

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          children: [1, 2, 3, 4, 5].map((e) =>
              Image.asset(
                  'asset/img/image_$e.jpeg',
                fit: BoxFit.cover, // 추가
              ),
          ).toList(),
        )
      ),
    );
  }
}
```

<img width="756" alt="스크린샷 2024-08-24 오후 10 29 37" src="https://github.com/user-attachments/assets/d8a6479e-a47b-4c32-a37c-3738152f3d33">

<br>
<br>

### Timer에 Controller 사용하기