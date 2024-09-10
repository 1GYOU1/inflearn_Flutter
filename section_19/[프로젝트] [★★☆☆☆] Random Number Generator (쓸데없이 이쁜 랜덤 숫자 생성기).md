# [프로젝트] [★★☆☆☆] Random Number Generator (쓸데없이 이쁜 랜덤 숫자 생성기)

### 프로젝트 소개

![Untitled-1-Recovered](https://github.com/user-attachments/assets/a5eff323-a5e1-46e6-ba16-5cf88ac4486a)

<br>

**1. 이미지 폴더 등록하기**

```yaml
# pubspec.yaml

  assets:
    - asset/img/
```

<br>

**2. 프로젝트 기본 세팅**

```dart
// lib/main.dart

import 'package:flutter/material.dart';
import 'package:random_number_generator/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
```

<br>

**3. 프로젝트에 사용할 색상 파일 세팅하기**

```dart
// lib/constant/color.dart

import 'package:flutter/material.dart';

// 프로젝트에 사용할 색상
const Color primaryColor = Color(0xFF2D2D33); // 주색상
const Color redColor = Color(0xFFEA4955);
const Color blueColor = Color(0xFF549FBF);
```

<br>

**4. 이중 배열 map사용, 숫자 이미지 불러오기**

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0), // 좌우 padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// 제목, 아이콘 버튼 영역
              _Header(),

              /// 숫자 영역
              _Body(),

              /// 버튼 영역
              _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          color: redColor,
          onPressed: () {},
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          123,
          456,
          789,
        ]
            .map((e) => e.toString().split(''))
            .map((e) => Row(
                  children: e
                      .map((number) => Image.asset(
                            'asset/img/$number.png',
                            width: 50.0,
                            height: 70.0,
                          ))
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor, // 버튼 배경색
        foregroundColor: Colors.white, // 버튼 글자색
      ),
      child: Text('생성하기!'),
    );
  }
}
```

