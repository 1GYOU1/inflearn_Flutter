# [★☆☆☆☆] Hello World

### 프로젝트 목표

![Untitled-1](https://github.com/user-attachments/assets/2f054c16-d0c9-4ada-acb4-a40e653f68ee)


<br>
<br>

### 프로젝트 생성하기

- ios 시뮬레이터 오류 때문에 아이클라우드 동기화가 되지 않는 로컬 폴더에 프로젝트를 생성하여 열어줬다.
- 용량 문제가 생길 수 있으니, 안드로이드와 iOS 플랫폼만 선택해서 생성해주기.
- Organization은 배포 아이디 생성시에 중요. 도메인을 거꾸로 적는 방식을 많이 사용함. 지금은 작성 X 

![스크린샷 2024-07-23 오후 11 30 35](https://github.com/user-attachments/assets/ab67d093-dd62-4221-a299-3ba4fb0d7f12)

![스크린샷 2024-07-23 오후 11 24 47](https://github.com/user-attachments/assets/8653ac52-e578-47a9-890f-be3528c11c43)

<br>
<br>

### 기본 프로젝트 안드로이드와 아이폰에서 모두 실행하고 콘솔창 확인 해보기

시뮬레이터, 애뮬레이터 각각 터미널이 1개씩 생성됨.

![스크린샷 2024-07-23 오후 11 44 38](https://github.com/user-attachments/assets/69fadd64-a1db-41b6-8f69-d8d3b0a0ecbe)

<br>
<br>

### 화면 중앙에 글자 렌더링 하기

하단 코드를 작성하고, Flutter Hot Restart 버튼을 클릭해 코드 재시작.

```dart
/// 파일 경로 lib/main.dart
import 'package:flutter/material.dart';

/// 'android/app/build.gradle'
void main(){
  /// 플러터 앱을 실행한다.
  runApp(

    /// MaterialApp은 항상 최상위에 위치한다. -> Flutter에서 사용하는 Material 디자인 사용하게 해줌
    /// Scaffold는 바로 아래 위치한다. -> 기본 형태, 구조를 쉽게 만들 수 있게 해줌.

    /// 위젯 -> Widget
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Code Factory'
          ),
        ),
      ),
    ),
  );
}
```

<br>

<img width="879" alt="스크린샷 2024-07-23 오후 11 59 12" src="https://github.com/user-attachments/assets/70bda53e-7509-4dea-9022-611347f7f0dd">

<br>
<br>

### 위젯이란 ?

command + click 하면 어떤 클래스에서 상속 받아 오는지 확인할 수 있는데,
MaterialApp이 위젯으로 되어있는 것을 확인할 수 있다.

![스크린샷 2024-07-24 오전 12 17 58](https://github.com/user-attachments/assets/dd88829c-e89f-4416-a115-4961aaa544fb)

<br>

노란줄은 '린트'라고 불리며, 좀 더 효율적인 코드로 작성하라고 제안해주는 의미로, 별로 신경 안써도 된다고 함 ~

문제가 생기는 코드는 빨간줄임.

analysis_options.yaml -> 어떤 식으로 코드를 쓰면 효율적인지 정할 수 있는 룰을 담아 놓는 파일인데, 삭제하면 노란줄 안나타남. 나는 주석 처리를 해두었다 !

![스크린샷 2024-07-24 오전 12 03 04](https://github.com/user-attachments/assets/532f7224-5983-4d16-87d3-38ae71feb77f)

<br>
<br>

### 배경 색상과 글자 색상 변경해보기

```dart
import 'package:flutter/material.dart';

/// 'android/app/build.gradle'
void main() {
  /// 플러터 앱을 실행한다.
  runApp(
    /// MaterialApp은 항상 최상위에 위치한다.
    /// Scaffold는 바로 아래 위치한다.
    /// 위젯 -> Widget
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text( /// 인스턴스 생성
            'Code Factory',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
```

<img width="821" alt="스크린샷 2024-07-24 오전 12 23 51" src="https://github.com/user-attachments/assets/12c88f8a-7030-4209-a682-18f8ef0ee1a6">

<br>
<br>

### Dart Format으로 코드 정리해서 가독성 높이기


,(콤마)를 굳이 쓰지 않아도 되는 경우에도 사용하는 이유는, 해당 콤마를 따라 자동 코드 정렬이 되기 때문이다.

dart 파일에서 마우스 우클릭을 하면 Reformat Code with 'dart format' 이라는 메뉴로 자동 정렬

<br>

다트 자동 정렬 기능 키맵 지정하기

Setting -> Keymap

![스크린샷 2024-07-24 오전 12 28 11](https://github.com/user-attachments/assets/42b978ba-cc5f-42be-beeb-6238b26bbaf5)
