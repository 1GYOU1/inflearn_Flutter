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

### CategoryStat 컴포넌트 제작하기

- 종류별 통계 레이아웃 작업

- 모서리 둥글기 조절
  - Card 위젯 : 모서리가 둥글고, 그림자 효과가 있는 위젯
    - shape : RoundedRectangleBorder 모서리 둥글게 만들기
      - borderRadius : 모서리 둥글기 정도 조절

  - Container
    - decoration : BoxDecoration
      - borderRadius : 모서리 둥글기 정도 조절

- ListView
  - scrollDirection : Axis.horizontal 가로 스크롤

- LayoutBuilder
  - 화면 크기에 따른 레이아웃 적용이 필요할때 사용
  - builder (constraints)
  - 사용 예시 : constraints.maxWidth

```dart
import 'package:dusty_dust/component/category_stat.dart';
import 'package:dusty_dust/component/main_stat.dart';
import 'package:dusty_dust/const/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainStat(),
            CategoryStat(), // 종류별 통계 컴포넌트
          ],
        ),
      ),
    );
  }
}
```

```dart
// dusty_dust/lib/component/category_stat.dart
import 'package:dusty_dust/const/color.dart';
import 'package:flutter/material.dart';

class CategoryStat extends StatelessWidget {
  const CategoryStat({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: LayoutBuilder( // 화면 크기에 따른 레이아웃 적용
            builder: (context, constraints) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: darkColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '종류별 통계',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                    child: ListView(
                      physics: PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: constraints.maxWidth / 3, // 화면 크기에 따라 레이아웃 적용
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('미세먼지'),
                              SizedBox(
                                height: 8.0,
                              ),
                              Image.asset(
                                'asset/img/bad.png',
                                width: 50,
                              ),
                              SizedBox(height: 8.0),
                              Text('46.0'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

- 강사님은 borderRadius를 중복으로 사용했는데, ClipRRect 위젯을 사용해서 한번에 css의 overflow: hidden 효과를 줄 수 있다.

```dart
//...
 Expanded(
  child: ClipRRect(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(16.0),
      bottomRight: Radius.circular(16.0),
    ),
    child: Container(
      color: lightColor,
      child: ListView(
        physics: PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          6,
          (index) => SizedBox(
//...
```

<img width="739" alt="스크린샷 2024-11-05 오후 11 40 36" src="https://github.com/user-attachments/assets/971665e8-a87b-4b64-955c-01d205300326">

<br>
<br>

### HourlyStat 컴포넌트 제작하기

- 시간별 통계 레이아웃 작업

```dart
// lib/screen/home_screen.dart
import 'package:dusty_dust/component/category_stat.dart';
import 'package:dusty_dust/component/hourly_stat.dart';
import 'package:dusty_dust/component/main_stat.dart';
import 'package:dusty_dust/const/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainStat(),
            CategoryStat(),
            HourlyStat(), // 시간별 통계 컴포넌트
          ],
        ),
      ),
    );
  }
}
```

```dart
// lib/component/hourly_stat.dart

import 'package:dusty_dust/const/color.dart';
import 'package:flutter/material.dart';

class HourlyStat extends StatelessWidget {
  const HourlyStat({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          color: lightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '시간별 미세먼지',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ...List.generate(
                24,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '11시',
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'asset/img/best.png',
                          height: 20.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '보통',
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

<img width="739" alt="스크린샷 2024-11-06 오후 10 59 10" src="https://github.com/user-attachments/assets/2112c744-cd83-4037-971a-0235a5c825b0">

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

### HTTP 이론

![Untitled-1](https://github.com/user-attachments/assets/103dd124-702b-4c64-a523-7c72b1277ffa)

![Untitled-1](https://github.com/user-attachments/assets/222461eb-e0a3-4383-aaac-c8184a605ef7)

![Untitled-3](https://github.com/user-attachments/assets/a8c377a0-ca5a-4cd7-b709-ba1804911930)

![Untitled-4](https://github.com/user-attachments/assets/d78f15e3-9118-4f45-bd15-4b9295339c76)

![Untitled-5](https://github.com/user-attachments/assets/0fb72c5d-648c-4bc2-b923-24068c0726ab)

![Untitled-6](https://github.com/user-attachments/assets/ddea1d7d-79c2-4789-b524-40db9eb0c466)

![Untitled-7](https://github.com/user-attachments/assets/8ade9ba1-8c5e-47b2-adc2-66548c160c79)

![Untitled-8](https://github.com/user-attachments/assets/e0fdb66b-c671-4ca5-bc27-ecae11c7b3ba)

![Untitled-9](https://github.com/user-attachments/assets/a612b2a9-f42f-47f4-956b-d9adfb96b2c5)

![Untitled-10](https://github.com/user-attachments/assets/d7dd15cd-f888-4e92-8398-bc2e5d335041)

![Untitled-11](https://github.com/user-attachments/assets/0468577c-cc35-4682-9ccf-6767f87aaa24)

<br>
<br>

### Postman으로 API 테스트하기

- 하단 사이트에서 시도별 실시간 평균정보 조회 선택 후 조회 버튼 클릭
- https://www.data.go.kr/data/15073855/openapi.do
- 요청주소, 요청변수 활용하여 Postman에서 테스트 진행

<img width="1512" alt="스크린샷 2024-11-09 오후 10 39 21" src="https://github.com/user-attachments/assets/fd47b9da-58a4-4dab-a63b-25cc3b25ba5b">

![스크린샷 2024-11-09 오후 10 38 19](https://github.com/user-attachments/assets/88ca0ce7-e383-4592-9907-ec47495465cf)

<br>
<br>

### Dio 사용해서 HTTP 요청 해보기

- pub.dev에서 dio 패키지 설치

<img width="1512" alt="스크린샷 2024-11-09 오후 10 41 38" src="https://github.com/user-attachments/assets/518eb541-dd49-40e1-891f-25bea9c08b4d">

<br>

- pubspec.yaml 파일에 dio 패키지 추가

```yaml
// pubspec.yaml
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.6
  dio: ^5.4.2+1 // 추가
```

### StatModel 만들기 ~ JSON 반환값을 StatModel로 변경하기

- json 반환 값을 커스텀하는 작업

작업 파일
- lib/model/stat_model.dart
- lib/repository/stat_repository.dart
- lib/screen/home_screen.dart

<br>

