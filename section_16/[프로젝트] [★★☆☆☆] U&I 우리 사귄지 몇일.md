# [프로젝트] [★★☆☆☆] U&I 우리 사귄지 몇일

### 프로젝트 목표
- DateTime 실전
- MediaQuery 사용해보기
- DatePicker 사용해보기
- 여러개의 위젯으로 코드 정리하기
- 폰트 적용해보기
- 테마 사용해보기

<br>

## 폰트 에셋파일 추가하기

- 폰트 유료는 따로 구매하거나, 무료 구글 폰트 같은거 다운 받아서 사용
- pubspec.yaml assets 이미지, fonts 관련 코드 추가

```yaml
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  assets:
    - asset/img/

  fonts:
    - family: parisienne # 폰트의 종류 이름 정해주기
      fonts: # 실제 적용할 폰트 파일
        - asset: asset/font/Parisienne-Regular.ttf

    - family: sunflower
      fonts:
        - asset: asset/font/Sunflower-Light.ttf
        - asset: asset/font/Sunflower-Medium.ttf
          weight: 500 # 폰트 구분을 위해 굵기 추가
        - asset: asset/font/Sunflower-Bold.ttf
          weight: 700
```

터미널 마지막에 0 뜨면 성공.
```
Process finished with exit code 0
```

<br>

## 레이아웃 작업하기

### 1. MediaQuery.of(context).size.width
```dart
width: MediaQuery.of(context).size.width
```
- 화면의 너비만큼 넓어지도록 설정, double.infinity랑 결과는 같다. 
- /2 화면의 절반, /3 화면의 3분의 1값을 계산하여 적용하고 싶을 때 유용

<br>

### 2. SafeArea
```dart
body: SafeArea( // 시스템 UI 영역 제외 설정
    top: true, // 상단 탑 영역 제외
    bottom: true, // 하단 시스템 터치 영역 제외
```

- **SafeArea** 시스템 UI 영역 제외 설정
- top, bottom, left, right 적용할 수 있으나, left right는 차이가 없음


#### top:true, bottom: true

<img width="756" alt="스크린샷 2024-08-28 오전 12 40 23" src="https://github.com/user-attachments/assets/8383603b-402f-41d5-a003-c721dc1e91f2">

#### top:false, bottom: false

<img width="756" alt="스크린샷 2024-08-28 오전 12 42 46" src="https://github.com/user-attachments/assets/9e1db77e-c8da-4f67-8294-bbb4694e86aa">

<br>

```dart
// u_and_i
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // 시스템 UI 영역 제외 설정
        top: true, // 상단 탑 영역 제외
        bottom: true, // 하단 시스템 터치 영역 제외
        child: SizedBox(
          width: MediaQuery.of(context).size.width, // 화면의 너비만큼 넓어지도록 설정, double.infinity랑 결과는 같음
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      Text('U&I'),
                      Text('우리 처음 만난 날'),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.favorite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Image.asset(
                    'asset/img/middle_image.png'
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
```

<br>

## 디자인 마무리하기

### 1. backgroundColor
```dart
backgroundColor: Colors.pink[100],
```
- 배경색 500 기본 값, 값이 커질수록 색이 진해지고, 적을수록 색이 연해진다.

<br>

### 2. TextStyle

- pubspec.yaml 파일에 등록했던 fonts의 family 이름 기준으로 fontFamily 사용.

```dart
Text(
    '우리 처음 만난 날',
    style: TextStyle(
        color: Colors.white, // 글씨 색상
        fontFamily: 'sunflower', // 폰트 종류
        fontSize: 30.0, // 폰트 사이즈
        fontWeight: FontWeight.w700, // 폰트 굵기
    ),
),
```

<br>

```dart
// u_and_i
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea( // 시스템 UI 영역 제외 설정
        top: true, // 상단 탑 영역 제외
        bottom: true, // 하단 시스템 터치 영역 제외
        child: SizedBox(
          width: MediaQuery.of(context).size.width, // 화면의 너비만큼 넓어지도록 설정, double.infinity랑 결과는 같긴함. 하지만 화면의 절반, 1/3 값을 차지하게 하고싶을 떄는 유용
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                          'U&I',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'parisienne',
                          fontSize: 80.0,
                        ),
                      ),
                      Text(
                          '우리 처음 만난 날',
                        style: TextStyle(
                          color:Colors.white,
                          fontFamily: 'sunflower',
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '2023.11.23',
                        style: TextStyle(
                          color:Colors.white,
                          fontFamily: 'sunflower',
                          fontSize: 20.0,
                        ),
                      ),
                      IconButton(
                        iconSize: 60.0,
                        color:Colors.red,
                        onPressed: (){},
                        icon: Icon(
                          Icons.favorite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Image.asset(
                    'asset/img/middle_image.png'
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
```

<img width="756" alt="스크린샷 2024-08-29 오후 11 31 22" src="https://github.com/user-attachments/assets/5899b53a-3efd-487f-b570-aebef7ff95e4">

<br>
<br>

## 테마 적용해보기