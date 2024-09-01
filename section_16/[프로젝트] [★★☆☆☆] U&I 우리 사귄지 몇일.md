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

- 상, 하단 코드 함수로 따로 빼서 관리하기, _Top 처럼 _언더바를 넣는 이유는, 외부에서 사용할 일 없이 내부에서만 사용할 수 있는 것을 뜻함.
- 폰트 테마 설정
    - MaterialApp에는 theme: ThemeDate()를 인스턴스화해서 사용할 수 있는데, MaterialApp 안에서 대부분의 위젯들의 테마들을 정할 수 있다.
- 그 외의 테마 설정
    - colorScheme: 앱의 주요 색상 설정
        - primary, secondary, background 등
    - appBarTheme: 앱 바의 스타일 설정
        - 색상, 아이콘 테마, 텍스트 스타일 등
    - buttonTheme: 버튼의 기본 스타일 설정
    - iconTheme: 아이콘의 기본 스타일 설정
    - scaffoldBackgroundColor: Scaffold 위젯의 배경색 설정
    - cardTheme: Card 위젯의 스타일 설정
    - inputDecorationTheme: 입력 필드의 스타일 설정
    - brightness: 앱의 전체적인 밝기 설정 (라이트/다크 모드)

```dart
// U_AND_I
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData( // 테마 설정
        fontFamily: 'sunflower', // 기본 폰트
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 80.0,
            fontFamily: 'parisienne',
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      home:HomeScreen(),
    ),
  );
}
```

```dart
// U_AND_I
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        // 시스템 UI 영역 제외 설정
        top: true, // 상단 탑 영역 제외
        bottom: true, // 하단 시스템 터치 영역 제외
        child: SizedBox(
          width: MediaQuery.of(context)
              .size
              .width, // 화면의 너비만큼 넓어지도록 설정, double.infinity랑 결과는 같긴함. 하지만 화면의 절반, 1/3 값을 차지하게 하고싶을 떄는 유용
          child: Column(
            children: [
              _Top(),
              _Bottom(), // 이미지
            ],
          ),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              'U&I',
              style: textTheme.displayLarge,
            ),
            Text(
              '우리 처음 만난 날',
              style: textTheme.bodyLarge,
            ),
            Text(
              '2023.11.23',
              style: textTheme.bodyMedium,
            ),
            IconButton(
              iconSize: 60.0,
              color: Colors.red,
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
              ),
            ),
            Text(
              'D+1',
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Image.asset('asset/img/middle_image.png'),
      ),
    );
  }
}
```

<br>
<br>

## DatePicker 사용해보기

- 하트 아이콘을 눌렀을 때 날짜를 고를 수 있는 화면 제작

### 1. showCupertinoDialog 위젯 추가

- showCupertinoDialog : 애플에서 사용하는 Dialog, 화면 위에 또 하나의 화면을 덮는 형태

```dart
IconButton(
    iconSize: 60.0,
    color: Colors.red,
    onPressed: () { // 아이콘을 눌렀을 때 실행되는 함수
        showCupertinoDialog( // Dialog 화면 위에 또 하나의 화면을 덮는 것(팝업 형태)
            context: context,
            builder: (context) {
            return Container(
                color: Colors.white,
                height: 300.0,
            );
            },
        );
    },
    icon: Icon(
        Icons.favorite,
    ),
),
```

어디로 정렬 돼야 하는지 알 수 없다면, 높이나 너비를 지정하더라도 전체(최대 사이즈)를 차지하게 된다.

<img width="756" alt="스크린샷 2024-09-01 오후 4 29 13" src="https://github.com/user-attachments/assets/0c7eef1b-a64b-4f1e-b229-1fcab8d7bf72">

<br>

### 2. showCupertinoDialog 가운데 정렬, 외부 부분 클릭시 닫힘 기능

- alignment: Alignment.center 으로 가운데 정렬
- barrierDismissible: true 위젯 외부 부분 클릭시 없애는 기능
    - Barrier - 위젯이 차지하고 있는 실제 다이얼로그의 외부 부분

```dart
IconButton(
    iconSize: 60.0,
    color: Colors.red,
    onPressed: () { // 아이콘을 눌렀을 때 실행되는 함수
    showCupertinoDialog(
        context: context,
        barrierDismissible: true, // 외부 부분 클릭시 닫힘
        builder: (BuildContext context) {
        return Align( // 정렬 위젯으로 감싸기
            alignment: Alignment.center, // 가운데 정렬
            child: Container(
            color: Colors.white,
            height: 300.0,
            ),
        );
        },
    );
    },
    icon: Icon(
        Icons.favorite,
    ),
),
```

정렬 후, height 값 적용

<img width="756" alt="스크린샷 2024-09-01 오후 4 37 05" src="https://github.com/user-attachments/assets/d935aa75-477d-4d61-b5d2-e3e488d80d22">

<br>

### DatePicker 날짜 선택 옵션

- showCupertinoDialog, CupertinoDatePicker로 ios 디자인 사용
- 날짜/시/분이 기본인데, mode, dateOrder 세팅하여 연/월/일 순으로 변경 가능

```dart
IconButton(
    iconSize: 60.0,
    color: Colors.red,
    onPressed: () {// 아이콘을 눌렀을 때 실행되는 함수
        showCupertinoDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
            return Align(
                alignment: Alignment.center,
                child: Container(
                color: Colors.white,
                height: 300.0,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date, // ① 날짜 선택
                    onDateTimeChanged: (DateTime date) {
                    print(date);
                    },
                    dateOrder: DatePickerDateOrder.ymd, // ② 연/월/일 순으로 변경
                ),
                ),
            );
            },
        );
    },
    icon: Icon(
        Icons.favorite,
    ),
),
```

CupertinoDatePicker 날짜 선택 기본

<img width="756" alt="스크린샷 2024-09-01 오후 5 28 09" src="https://github.com/user-attachments/assets/2e4b5c6e-05a9-4d92-9d1b-6d098272cbe8">

연/월/일 순으로 변경 후

<img width="756" alt="스크린샷 2024-09-01 오후 6 30 53" src="https://github.com/user-attachments/assets/f572ad17-4f6d-450e-9b35-dace0ee2c9cc">

<br>

#### showDatePicker - 안드로이드 기본 디자인

- 강사님이 showDialog, DatePicker 로 변경만하면 안드로이드 디자인으로 변경 가능이랬는데 안됨..ㅜㅜ 하단과 같이 사용

```dart
IconButton(
    iconSize: 60.0,
    color: Colors.red,
    onPressed: () {
        showDatePicker(
            context: context,
            initialDate: DateTime.now(), // 처음 표시될 날짜(필수)
            firstDate: DateTime(2000), // 선택 가능한 가장 이른 날짜(필수)
            lastDate: DateTime(2100), // 선택 가능한 가장 늦은 날짜(필수)
        );
    },
    icon: Icon(
        Icons.favorite,
    ),
),
```

<img width="756" alt="스크린샷 2024-09-01 오후 5 42 27" src="https://github.com/user-attachments/assets/9fd823ea-8d24-419c-b760-2c97792f1168">

<br>

## 선택된 날짜 상태관리하기

### 1. 데이터를 다루기 위해 StatefulWidget로 변경
```dart
class _Top extends StatefulWidget {
```
### 2. selectedDate 변수 만들기
```dart
class _TopState extends State<_Top> {
  DateTime selectedDate = DateTime.now(); // 현재 날짜와 시간 불러오기
```
### 3. 현재 날짜와 시간 기준으로 변수 사용하여 년/월/일 텍스트 불러오기
```dart
Text(
    '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
    style: textTheme.bodyMedium,
),
```
### 4. D-day 구하기(현재 시간과 선택된 날짜의 차이 구하기)
- 지금.difference(선택한 날짜) : 지금 기준으로 선택한 날짜와의 차이 구하기
- .inDays : 날 수로 계산
```dart
Text(
    'D+${now.difference(selectedDate).inDays + 1}',
    style: textTheme.displayMedium,
),
```
### 5. 선택한 날짜로 값을 변경해주며 build 다시 실행해 화면에 보여주도록 setState 함수 작성
```dart
onDateTimeChanged: (DateTime date) { // 날짜 변경될 때 실행되는 함수
    print(date);
    setState(() {
        selectedDate = date;
    });
},
```

<img width="756" alt="스크린샷 2024-09-01 오후 10 48 58" src="https://github.com/user-attachments/assets/f6a04e7b-9687-43fa-8c39-1e817862ad90">


<br>

## 미래 날짜 선택 가능한 버그 수정하기

### 1. 선택한 날짜부터 DatePicker 보여주기
- 오늘 날짜 -> 변수에 저장된 선택한 날짜부터 표시
```dart
child: CupertinoDatePicker(
    //...
    initialDateTime: selectedDate, // 선택 날짜로 초기화(초기 날짜 시간)
```

### 2. 선택 가능한 최대 날짜를 현재일로 변경하기
- 최대 현재일을 기준으로 미래 날짜 선택 X
```dart
child: CupertinoDatePicker(
    //...
    maximumDate: DateTime.now(), // 최대 날짜
```

위 코드 적용 시 오늘 날짜 이후로 선택 X, 선택한 날짜 부터 DatePicker 보여줌.

<img width="756" alt="스크린샷 2024-09-01 오후 7 50 26" src="https://github.com/user-attachments/assets/4bd5474b-9207-4fd5-acdc-26f197e6d422">

<br>

_Top 클래스 최종 코드

```dart
//... 생략

class _Top extends StatefulWidget {
  const _Top({super.key});

  @override
  State<_Top> createState() => _TopState();
}

class _TopState extends State<_Top> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              'U&I',
              style: textTheme.displayLarge,
            ),
            Text(
              '우리 처음 만난 날',
              style: textTheme.bodyLarge,
            ),
            Text(
              '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
              style: textTheme.bodyMedium,
            ),
            IconButton(
              iconSize: 60.0,
              color: Colors.red,
              onPressed: () {
                // 아이콘을 눌렀을 때 실행되는 함수
                showCupertinoDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.white,
                        height: 300.0,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: selectedDate,
                          maximumDate: DateTime.now(),
                          onDateTimeChanged: (DateTime date) {
                            print(date);
                            setState(() {
                              selectedDate = date;
                            });
                          },
                          dateOrder: DatePickerDateOrder.ymd,
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(
                Icons.favorite,
              ),
            ),
            Text(
              'D+${now.difference(selectedDate).inDays + 1}',
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
//... 생략
```

<br>

## 상태 상위로 올리기

- 알아보기 쉬운 코드 작성하기
- 상태를 중앙화하기 - 가장 공통이 되는 위젯에서 상태 관리하기

### 1. HomeScreen StatelessWidget -> StatefulWidget으로 변경하고 selectedDate 변수 선언

- selectedDate 변수를 공통으로 관리하기 위해 HomeScreen에서 선언

```dart
class HomeScreen extends StatefulWidget { // StatefulWidget으로 변경
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now(); // 선언
```

<br>

### 2. selectedDate 파라미터로 받아서 사용

- HomeScreen안에 있는 selectedDate를 Top 위젯으로 연동해주려면, 파라미터로 받아와서 사용하면 된다.

```dart
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now(); // 선언

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: true,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _Top(
                selectedDate: selectedDate, // ① 파라미터로 받아오기
                onPressed: onHeartPressed,
              ),
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }

//... 생략

class _Top extends StatefulWidget {
  final DateTime selectedDate; // ② 추가
  final VoidCallback? onPressed;

  const _Top({
    required this.selectedDate, // ③ 추가
    required this.onPressed,
    super.key,
  });

  @override
  State<_Top> createState() => _TopState();
}

class _TopState extends State<_Top> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              'U&I',
              style: textTheme.displayLarge,
            ),
            Text(
              '우리 처음 만난 날',
              style: textTheme.bodyLarge,
            ),
            Text(
              '${widget.selectedDate.year}.${widget.selectedDate.month}.${widget.selectedDate.day}', // ④ widget.selectedDate 로 변경
              style: textTheme.bodyMedium,
            ),
            IconButton(
              iconSize: 60.0,
              color: Colors.red,
              onPressed: widget.onPressed,
              icon: Icon(
                Icons.favorite,
              ),
            ),
            Text(
              'D+${now.difference(widget.selectedDate).inDays + 1}',// ④ widget.selectedDate 로 변경
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
```

<br>

### 3. onPressed 함수 상단으로 옮겨주기, _Top statelessWidget으로 변경

- selectedDate가 더이상 _Top 위젯에 있지 않기 때문에 setState 할 수 없어서 오류가 남. 
- onPressed 함수를 상단으로 옮겨 해결

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true, 
        bottom: true, 
        child: SizedBox(
          width: MediaQuery.of(context).size.width, 
          child: Column(
            children: [
            _Top(
                selectedDate: selectedDate,
                onPressed: () { // 상단으로 옮기기
                  showCupertinoDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: Colors.white,
                          height: 300.0,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: selectedDate,
                            maximumDate: DateTime.now(),
                            onDateTimeChanged: (DateTime date) {
                              print(date);
                              setState(() {
                                selectedDate = date;
                              });
                            },
                            dateOrder: DatePickerDateOrder.ymd,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget { // StatelessWidget으로 변경
  final DateTime selectedDate;
  final VoidCallback? onPressed; // 추가

  const _Top({
    required this.selectedDate,
    required this.onPressed, // 추가
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              'U&I',
              style: textTheme.displayLarge,
            ),
            Text(
              '우리 처음 만난 날',
              style: textTheme.bodyLarge,
            ),
            Text(
              '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
              style: textTheme.bodyMedium,
            ),
            IconButton(
              iconSize: 60.0,
              color: Colors.red,
              onPressed: onPressed, // 수정
              icon: Icon(
                Icons.favorite,
              ),
            ),
            Text(
              'D+${now.difference(selectedDate).inDays + 1}',
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
```

<br>

### onPressed 함수로 만들어서 가독성 개선

- UI를 표현하고 있는 빌드 함수에는 로직이 들어가 있는 코드를 작성하지 않는 것이 좋다. 가독성이 떨어짐.
- onPressed 함수로 따로 만들어서 가독성 개선
- onPressed는 VoidCallback 타입이라 반환 값이 없고, 파라미터를 받지 않는 함수라서 함수 뒤에 괄호를 작성하지 않는다. 실행, 반환 X

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: true,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _Top(
                selectedDate: selectedDate,
                onPressed: onHeartPressed, // 함수 추가, 괄호 X
              ),
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }

  void onHeartPressed() { // 함수 만들기
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            height: 300.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              maximumDate: DateTime.now(),
              onDateTimeChanged: (DateTime date) {
                print(date);
                setState(() {
                  selectedDate = date;
                });
              },
              dateOrder: DatePickerDateOrder.ymd,
            ),
          ),
        );
      },
    );
  }
}

class _Top extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback? onPressed;

  const _Top({
    required this.selectedDate,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
        //...
  }
}
//...
```

<br>

최종 코드 
```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: true,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _Top(
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
              ),
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }

  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            height: 300.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              maximumDate: DateTime.now(),
              onDateTimeChanged: (DateTime date) {
                print(date);
                setState(() {
                  selectedDate = date;
                });
              },
              dateOrder: DatePickerDateOrder.ymd,
            ),
          ),
        );
      },
    );
  }
}

class _Top extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback? onPressed;

  const _Top({
    required this.selectedDate,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              'U&I',
              style: textTheme.displayLarge,
            ),
            Text(
              '우리 처음 만난 날',
              style: textTheme.bodyLarge,
            ),
            Text(
              '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
              style: textTheme.bodyMedium,
            ),
            IconButton(
              iconSize: 60.0,
              color: Colors.red,
              onPressed: onPressed,
              icon: Icon(
                Icons.favorite,
              ),
            ),
            Text(
              'D+${now.difference(selectedDate).inDays + 1}',
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Image.asset('asset/img/middle_image.png'),
      ),
    );
  }
}
```