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

//...

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

//...
```

<img width="756" alt="스크린샷 2024-09-11 오전 12 05 05" src="https://github.com/user-attachments/assets/f4380afc-fcf2-4207-912b-2e00aff827f4">

<br>

**5. 상태 위로 올리기, 랜덤 숫자 생성하기**

- 최상단 import 'dart:math'; -> 난수 생성 기능 제공

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'dart:math'; // 난수 생성 기능 제공

class HomeScreen extends StatefulWidget { // -> StatefulWidget으로 변경
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [
    123,
    456,
    789,
  ];

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
              _Body(
                numbers: numbers,
              ),

              /// 버튼 영역
              _Footer(
                onPressed: generateRandomNumber, // 버튼 클릭시 랜덤 숫자로 변경 함수
              ),
            ],
          ),
        ),
      ),
    );
  }

  generateRandomNumber() {
    final rand = Random();

    final Set<int> randomNumbers = {};

    while (randomNumbers.length < 3) {
      final randomNumber = rand.nextInt(1000);

      randomNumbers.add(randomNumber);
    }

    setState(() {
      numbers = randomNumbers.toList();
    });
  }
}
//...

class _Body extends StatelessWidget {
  final List<int> numbers;

  const _Body({super.key, required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numbers
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
//...
```

<img width="756" alt="스크린샷 2024-09-11 오전 12 13 39" src="https://github.com/user-attachments/assets/d800c860-1d71-4064-8258-95f7644fbba9">

<br>

**Navigator 사용해서 네비게이션 해보기**

스크린 이동
```dart
// lib/screen/home_screen.dart

onSettingIconPressed() {
	Navigator.of(context).push(
		// 홈 화면에서 설정 화면으로 이동(스크린 쌓기)
		MaterialPageRoute(builder: (context) {
			return SettingScreen();
		}),
	);
}
```

<br>

뒤로 가기 버튼
```dart
// lib/screen/setting_screen.dart

class _Button extends StatelessWidget {
  const _Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop(); // 뒤로 가기
      },
      child: Text('저장'),
    );
  }
}
```

설정 아이콘 클릭시 setting_screen 화면 노출

<img width="756" alt="스크린샷 2024-09-14 오전 12 22 04" src="https://github.com/user-attachments/assets/b04176bf-3bb9-4406-833a-3b3c8a7d5e2b">

<br>

**공통 컴포넌트 제작하기**

공통으로 사용하는 이미지 생성 map 부분 컴포넌트 파일로 따로 빼서 관리하기
```dart
// lib/component/number_to_image.dart
import 'package:flutter/material.dart';

class NumberToImage extends StatelessWidget {
  final int number;
  const NumberToImage({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
				.toString()
				.split('')
				.map((number) => Image.asset(
						'asset/img/$number.png',
						width: 50.0,
						height: 70.0,
					))
				.toList(),
    );
  }
}
```

<br>

컴포넌트 사용 예시

```dart
// lib/screen/home_screen.dart

class _Body extends StatelessWidget {
  final List<int> numbers;

  const _Body({super.key, required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numbers
            .map((e) => NumberToImage(number: e)) // 숫자 이미지 컴포넌트 사용
            .toList(),
      ),
    );
  }
}
```
```dart
// lib/screen/setting_screen.dart

class _Number extends StatelessWidget {
  final double maxNumber;

  const _Number({super.key, required this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            NumberToImage(number: maxNumber.toInt()), // 숫자 이미지 컴포넌트 사용
          ],
        ),
      ),
    );
  }
}
```

<br>

**Slider 위젯 사용해보기**

- 설정해둔 최소, 최대 값에 따라 슬라이더 범위 설정
- 슬라이더 값 변경시 상태 변경
- 슬라이더 상태 올려서 중앙화

```dart
import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/component/number_to_image.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000; // 최대 숫자 - 슬라이드에서 던져주는 형태가 double

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Number(
                maxNumber: maxNumber,
              ),
              _Slider( // 슬라이더
                value: maxNumber,
                onChanged: onSliderChanged,
              ),
              _Button(),
            ],
          ),
        ),
      ),
    );
  }

  // 슬라이더 값 변경 시 호출되는 함수
  onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }
}

//...

// 슬라이더
class _Slider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _Slider({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 1000,
      max: 100000,
      activeColor: redColor, // 슬라이더 색상
      onChanged: onChanged, // 슬라이더 값 변경 시 호출되는 함수
    );
  }
}
```

<br>

**push()와 pop() 함수로 스크린간 아규먼트 주고받기**

- 랜덤 숫자 최대 값 설정 후 저장 버튼 누르면 홈 화면에서 생성 버튼 클릭 시 최대 값 연동 적용되는 기능
- HomeScreen, SettingScreen의 maxNumber 연동

```dart
// lib/screen/home_screen.dart
// ...

class HomeScreen extends StatefulWidget {
// ...

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [
    123,
    456,
    789,
  ];
  int maxNumber = 1000; // ➀ 최대 숫자 선언

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(
                onPressed: onSettingIconPressed,
              ),
              _Body(
                numbers: numbers,
              ),
              _Footer(
                onPressed: generateRandomNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 설정 아이콘 누르면 호출되는 함수 ➃
  onSettingIconPressed() async {
    // async await 사용해서
    final result = await Navigator.of(context).push(
      // 홈 화면에서 설정 화면으로 이동(스크린 쌓기)
      MaterialPageRoute(builder: (context) {
        return SettingScreen();
      }),
    );

    maxNumber = result;
  }

  // 생성하기 버튼 누르면 호출되는 함수
  generateRandomNumber() {
    final rand = Random();

    final Set<int> randomNumbers = {};

    while (randomNumbers.length < 3) {
      final randomNumber = rand.nextInt(maxNumber); // ➁

      randomNumbers.add(randomNumber);
    }

    setState(() {
      numbers = randomNumbers.toList();
    });
  }
}

//...
```

```dart
// lib/screen/setting_screen.dart

//...

class SettingScreen extends StatefulWidget {
//...

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000; // 최대 숫자가 HomeScreen의 랜덤숫자 생성 부분과 연동이 되어야함.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //...

              _Button(
                onPressed: onSavePressed, // ➂-4 저장 버튼
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 저장 버튼 누르면 호출되는 함수
  onSavePressed() {
    Navigator.of(context).pop(
      maxNumber.toInt(), // ➄
    ); // 뒤로 가기
  }

  // 슬라이더 값 변경 시 호출되는 함수
  onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onPressed; // 버튼 동작 외부에서 정의하기 위해 선언 ➂-1

  const _Button({
    super.key, 
    required this.onPressed // ➂-2
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed, // ➂-3
      child: Text('저장'),
    );
  }
}

//...
```

<br>

**push() 실행한 스크린에 아규먼트 보내주기**

- 최대 숫자 세팅 후 저장한 화면으로 다시 돌아갔을 때 저장되어있는 기능
- HomeScreen에서 최대 숫자를 SettingScreen으로 보내기(생성할 때 초기 값을 넘겨주는 방식)

```dart
// lib/screen/setting_screen.dart

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/component/number_to_image.dart';

class SettingScreen extends StatefulWidget {
  final int maxNumber; // ➀

  const SettingScreen({super.key, required this.maxNumber}); // ➁

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000; // 최대 숫자 - 슬라이드에서 던져주는 형태가 double

  // state가 생성되면 무조건 첫 번째 한번만 실행되는 함수
  initState() { // ➂
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Number(
                maxNumber: maxNumber,
              ),
              _Slider(
                value: maxNumber,
                onChanged: onSliderChanged,
              ),
              _Button(
                onPressed: onSavePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

//...
}

//...
```

```dart
// lib/screen/home_screen.dart
//...

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [
    123,
    456,
    789,
  ];
  int maxNumber = 1000; // ➃

  @override
  Widget build(BuildContext context) {
    //...
  }

  // 설정 아이콘 누르면 호출되는 함수
  onSettingIconPressed() async {
    final result = await Navigator.of(context).push(
      // 홈 화면에서 설정 화면으로 이동(스크린 쌓기)
      MaterialPageRoute(builder: (context) {
        return SettingScreen(maxNumber: maxNumber); // ➄
      }),
    );

    maxNumber = result;
  }

//...
}

//...
```