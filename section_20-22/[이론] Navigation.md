# [이론] Navigation

### 프로젝트 세팅하기

- 공통 레이아웃 템플릿을 만들어서 여러 페이지에서 공통으로 사용할 수 있다.
- appBar를 사용하면 페이지로 이동했을 경우, 자동으로 뒤로가기 버튼이 생긴다.

<br>

- children의 정의 - List<Widget> 형태이다.
```dart
final List<Widget> children;
```

**공통 템플릿 만들기**

- children의 정의를 확인하여 타입에 맞게 선언해주어, DefaultLayout을 사용하고 있는 상위 위젯에서 사용할 수 있다.
```dart
// lib/layout/default_layout.dart

import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final List<Widget> children; // ① children 선언
  final String title; // ② title 선언

  const DefaultLayout({
    super.key,
    required this.children, // ① - 2) children 선언
    required this.title, // ② - 2) title 선언
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // ② - 3) title 사용
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children, // ② - 3) children 사용
        ),
      ),
    );
  }
}
```

사용 예시

```dart
// lib/home_screen.dart

import 'package:flutter/material.dart';
import 'package:navigation/screen/route_one_screen.dart';
import 'package:navigation/layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Home', // title 영역
      children: [
        // children 영역
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RouteOneScreen(), // RouteOneScreen 노출
              ),
            );
          },
          child: Text('Push'),
        ),
      ],
    );
  }
}
```

![무제 (1)](https://github.com/user-attachments/assets/22079116-44ec-4d50-bf1a-5e3203369470)

<br>
<br>

### Argument 보내는법

- 방법 1
- 출력하고 싶은 클래스 위젯 내에 인스턴스 변수를 선언해주고, home_screen에서 값을 넘겨받아서 출력

```dart
// lib/route_one_screen.dart

import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';

class RouteOneScreen extends StatelessWidget {
  final int number; // ① number 선언

  const RouteOneScreen({
    required this.number, // ① - 2) number 선언
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Route One',
      children: [
        Text('argument: $number'), // ① - 4) 출력
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop(
              456, // ② - 1) 값 되돌려 보내기
            );
          },
          child: Text('Pop'),
        ),
      ],
    );
  }
}
```

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';
import 'package:navigation/screen/route_one_screen.dart';
import 'package:navigation/layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Home',
      children: [
        OutlinedButton(
          onPressed: () async {
            // ② - 2) async await로 값 넘겨받기
            final result = await Navigator.of(context).push<int>( 
              MaterialPageRoute(
                builder: (context) => RouteOneScreen(number: 20), // ① - 3) 값 넘겨주기
              ),
            );
            print(result); // ② - 3) 값 출력
          },
          child: Text('Push'),
        ),
      ],
    );
  }
}
``` 

![무제 (2)](https://github.com/user-attachments/assets/116365e9-0aad-40e6-9c3b-034bb7c1770f)

![스크린샷 2024-09-22 오후 6 05 50](https://github.com/user-attachments/assets/9d2f7d50-12ec-4d64-8bd8-63e7422142e9)

<br>

- 방법 2
- MaterialPageRoute의 settings 속성을 사용하여 값을 전달할 수 있다.

```dart
// lib/screen/route_one_screen.dart

// ...
OutlinedButton(
  onPressed: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return RouteTwoScreen();
        },
        // 다음 화면으로 이동할 때 값 전달
        settings: RouteSettings( // ① - 1) settings 속성 사용
          arguments: 789,
        ),
      ),
    );
  },
  child: Text('Push'),
),
//...
```

```dart
// lib/screen/route_two_screen.dart

import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments; // ① - 2) arguments 선언

    return DefaultLayout(
      title: 'RouteTwoScreen',
      children: [
        Text(
          arguments.toString(), // ① - 3) arguments 출력
          textAlign: TextAlign.center,
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop'),
        ),
      ],
    );
  }
}
```

![무제 (3)](https://github.com/user-attachments/assets/f011edc2-b6e2-43a1-b386-8926692309b0)

<br>
<br>

### Declarative Routing과 Named Routes

- Imperative Routing 명령식 라우팅

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => RouteOneScreen(), // Imperative Routing 명령식 라우팅
  ),
);
```

- 라우터를 중앙화 시켜서 관리하는 방법
- pushNamed 사용

```dart
Navigator.of(context).pushNamed('/three');
```

```dart
// lib/main.dart

// Imperative vs Declarative
void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        // key - 라우트 이름
        // value - builder -> 이동하고싶은 라우트
        '/': (context) => HomeScreen(),
        '/one': (context) => RouteOneScreen(
              number: 999,
            ),
        '/two': (context) => RouteTwoScreen(),
        '/three': (context) => RouteThreeScreen(),
      },
    ),
  );
}
```

```dart
// lib/screen/route_two_screen.dart

Widget build(BuildContext context) {
  final arguments = ModalRoute.of(context)?.settings.arguments;

//...
  OutlinedButton(
    onPressed: () {
      Navigator.of(context).pushNamed( // 라우트 이동
        '/three', 
        arguments: 111111,
      );
    },
    child: Text('Push Route Three'),
  ),
//...
```

```dart
// lib/screen/route_three_screen.dart

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments; // arguments 선언

    return DefaultLayout(
      title: 'RouteThreeScreen',
      children: [
        Text(
          arguments.toString(), // arguments 출력
          textAlign: TextAlign.center,
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop(); // 뒤로가기
          },
          child: Text('Pop'),
        ),
      ],
    );
  }
}
```

<br>
<br>

### pushReplacement() 배워보기

- pushReplacement(), pushReplacementNamed()
- 현재 위치한 화면의 다음 화면에서 뒤로가기 버튼을 눌렀을때, 현재 위치의 화면이 아닌 이전 화면으로 돌아가게 해준다. 배열에서 잘라내기 기능과 비슷하다.
- 같은 기능인데, declarative 분야, imperative 분야의 차이이다.

```dart
// pushReplacement
OutlinedButton(
	onPressed: () {
		// [HomeScreen, RouteOneScreen, RouteTwoScreen, RouteThreeScreen]
		// push - [HomeScreen, RouteOneScreen, RouteTwoScreen, RouteThreeScreen]
		// pushReplacement - [HomeScreen, RouteOneScreen, RouteThreeScreen]
		Navigator.of(context).pushReplacement(
			MaterialPageRoute(
				builder: (BuildContext context) {
					return RouteThreeScreen();
				},
				settings: RouteSettings(
					arguments: '123123',
				),
			),
		);
	},
	child: Text('Push Replacement'),
),

// pushReplacementNamed
OutlinedButton(
	onPressed: () {
	Navigator.of(context)
		.pushReplacementNamed('/three', arguments: '999');
	},
	child: Text('Push Replacement Named'),
),
```