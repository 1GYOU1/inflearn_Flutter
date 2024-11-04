# [프로젝트] [★★★★★] Dusty Dust (미세먼지)

<br>

### 프로젝트 소개

- 정부에서 제공하는 API를 이용하여 선택한 지역의 가장 최근 24시간 데이터로 시간별 미세먼지(이황산가스, 일산화탄소, 오존 등) 데이터를 보여주며, 스크롤 영역을 구현해보고 수치에 따라서 배경 색, 이모티콘, 레이블, 코멘트 등이 바뀌는 앱.

![Untitled-1](https://github.com/user-attachments/assets/625ab039-5a09-4d3c-9ece-8bd9777cb6b1)

<br>
<br>

### pubspec 파일 세팅하기

초기 프로젝트 세팅
```dart 
// dusty_dust/lib/main.dart

import 'package:flutter/material.dart';
import 'package:dusty_dust/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
```

```dart
// dusty_dust/lib/screen/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

```yaml
# pubspec.yaml

  assets:
    - asset/img

  fonts:
    - family: sunflower
      fonts:
        - asset: asset/fonts/Sunflower-Bold.ttf
          weight: 700
        - asset: asset/fonts/Sunflower-Medium.ttf
          weight: 500
        - asset: asset/fonts/Sunflower-Light.ttf
          weight: 300
```

<br>
<br>

### MainStat 컴포넌트 제작하기

- main_stat.dart 파일 생성하여 컴포넌트 불러오기

```dart
// lib/screen/home_screen.dart
import 'package:dusty_dust/component/main_stat.dart';
import 'package:dusty_dust/const/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          MainStat(), // 메인 화면 컴포넌트
        ],
      ),
    );
  }
}
```

<br>

- ts 변수를 생성하여 텍스트 스타일을 공통으로 쓰는 부분을 정리해주기
- copyWith 메서드를 사용하여 텍스트 스타일 추가하거나 변경하기

```dart
// dusty_dust/lib/component/main_stat.dart
import 'package:flutter/material.dart';

class MainStat extends StatelessWidget {
  const MainStat({super.key});

  @override
  Widget build(BuildContext context) {
    // 텍스트 스타일 변수 생성
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 40.0,
    );

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              '서울',
              style: ts.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text('2024-11-1 11:00',
                style: ts.copyWith(
                  fontSize: 20.0,
                )),
            SizedBox(height: 20.0),
            Image.asset(
              'asset/img/good.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            SizedBox(height: 20.0),
            Text('보통',
                style: ts.copyWith(
                  fontWeight: FontWeight.w700,
                )),
            Text('나쁘지 않네요!',
                style: ts.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                )),
          ],
        ),
      ),
    );
  }
}
```

<br>

<img width="739" alt="스크린샷 2024-11-04 오전 12 03 35" src="https://github.com/user-attachments/assets/dee683df-ac3d-4957-8623-ff525d555028">

<br>
<br>

### 에어코리아 API 키 발급받기

공공데이터 포털 사이트 회원가입 후 "에어코리아 미세먼지" 검색
- https://www.data.go.kr/

한국환경공단_에어코리아_대기오염통계 현황 -> 활용신청 버튼 클릭
- https://www.data.go.kr/data/15073855/openapi.do

![스크린샷 2024-10-30 오전 12 00 19](https://github.com/user-attachments/assets/01eceb7c-359b-4222-a731-a9701737381d)

![스크린샷 2024-10-30 오전 12 00 25](https://github.com/user-attachments/assets/585994f9-ee12-45a4-8f89-ede117aab2ac)

![스크린샷 2024-10-30 오전 12 01 19](https://github.com/user-attachments/assets/a95e8a13-9dab-49ae-a2ac-995de90cb1fb)

신청 완료

일반 인증키 Encoding, Decoding 같은 값인데 URL에서 사용할 수 있게 되어있느냐 아니냐에 차이가 있다. 둘 중에 하나가 안되면 다른 하나를 사용하면 된다.
- Encoding : URL에서 사용할 수 있게 변환하는 것
- Decoding : URL에서 사용할 수 있게 변환된 값을 원래 값으로 변환하는 것

<br>
<br>

### 