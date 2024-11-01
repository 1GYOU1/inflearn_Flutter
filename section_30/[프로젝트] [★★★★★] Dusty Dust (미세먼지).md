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

```dart
```

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