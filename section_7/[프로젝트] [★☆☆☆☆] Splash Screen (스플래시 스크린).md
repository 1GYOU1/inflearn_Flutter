# [★☆☆☆☆] Splash Screen (스플래시 스크린)

스플래시 스크린 : 로딩, 대기 화면

### 프로젝트 목표
- StatelessWidget 사용법
- Asset 이미지 등록법
- Image 위젯 사용법
- Column 위젓 사용법
- HexCode 색상 사용법
- CircularProgressIndicator 위젯 사용법
- Padding 위젯 사용법
- SizeBox 위젯 사용법

<br>
<br>

### YAML 구조
- 사람이 쉽게 읽고 쓸 수 있는ㄴ 데이터 직렬화(컴퓨터가 읽을 수 있는 쉬운 구조로 변경) 언어이다.
- 주로 설정 파일이나 데이터 전송 형식으로 사용되며 들여쓰기를 통해 계층 구조를 표현한다.
- 맵 형태 또는 JSON 형태의 구조를 만들 때 주로 사용됨.
- Flutter 프로젝트를 생성하면 관련 세팅은 **pubspec.yaml** 파일에서 함.

### Key/Value Pair
```dart
{
    'name': 'Code Factory',
    'age': 32,
    'gender': 'Male'
}
```

```yaml
name: Code Factory
age: 32
gender: Male
```

### List

- 하이픈으로 리스트를 표현

```dart
{
    'ive_members': [
        'YuJin',
        'WonYoung',
        'Rei',
        'GaEul',
        'ESeo'
    ]
}
```

```yaml
ive_members:
    - YuJin
    - WonYoung
    - Rei
    - GaEul
    - ESeo
```

### Nested Key / Value Pair

- 맵을 중첩시킬 때마다 띄어쓰기를 해야함.

```dart
{
    'person':{
        'name': 'Code Factory',
        'age': 32,
        'address': {
            'city': 'Seoul',
            'country': 'South Korea'
        }
    }
}
```

```yaml
person:
    name: Code Factory
    age: 32
    address:
        city: Seoul
        country: South Korea
```

### Complex Structure

- 리스트와 맵을 섞었을 때 

```dart
{
    'members': [
        {
            'name': 'Rei'.
            'age': 20
        },
        {
            'name': 'WonYoung',
            'age': 21
        }
    ]
}
```

```yaml
members:
    - name: Rei
      age: 20
    - name: WonYoung
      age: 21
```

### Comment
- 주석

```yaml
# 이건 주석입니다.
app_name: hello_world # 이것도 주석입니다.
```

<br>
<br>

### Asset 파일 pubspec.yaml에 등록하기

![스크린샷-2024-08-05-오전-12 05 26](https://github.com/user-attachments/assets/1ee4292a-fb54-4d5b-a038-b6bc8409740c)

1. asset/img/logo.png 폴더 만들고 이미지 넣어주기

2. pubspec.yaml 파일에 asset 이미지 정보 추가해주기
- 이미지가 아니더라도 파일 등 새로 추가하여 앱에서 사용하고 싶다면 
<br>사용하고 싶은 폴더 경로들을 모두 등록해줘야한다.

3. pubspec.yaml 파일을 변경하게 되면 PubGet 버튼을 눌러서 적용시켜야함.

4. code 0 이면 성공, 1 이면 실패
- 버튼을 누르면 하단에 콘솔창이 뜨고, PubGet이 실행 됐다는 메세지가 나오는데,
<br> 최하단에 Process finished with exit code 0 이면 성공이고, 1이면 실패라고 한다 !

<br>
<br>

### Image 위젯 사용해보기
```dart
// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Image.asset('asset/img/logo.png'),
      ),
    ),
  );
}
```

<img width="771" alt="스크린샷 2024-08-05 오전 12 18 38" src="https://github.com/user-attachments/assets/e05c156c-bfce-4c46-bf84-dc55d08ef639">

<br>
<br>

### Hex Code를 사용해서 색상 지정하기

입력 예시
```
Color(0xFFfa8072),
```
- Flutter는 16진수인데, 16진수를 표현하는 방법은 `0x`를 앞에다가 붙여주면 된다고 한다.
- `FF`는 알파, 투명도라고 함.
- fa8072는 RGB 색상을 핵스코드로 표현한 값

```dart
// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFfa8072),
        body: Image.asset('asset/img/logo.png'),
      ),
    ),
  );
}
```

<img width="771" alt="스크린샷 2024-08-05 오전 12 24 07" src="https://github.com/user-attachments/assets/32754d40-523b-414d-ae41-7b40f4957e84">


<br>
<br>

### Column 위젯 사용해보기

```dart
// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFfa8072),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo.png',
            )
          ]
        )
      ),
    ),
  );
}
```

<img width="771" alt="스크린샷 2024-08-05 오전 12 30 23" src="https://github.com/user-attachments/assets/64d56b33-e01c-402e-8aaa-a6e68fdda22c">


<br>
<br>

### CircularProgressIndicator 위젯 사용해보기

- CircularProgressIndicator : 로딩 위젯

```dart
// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFfa8072),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo.png',
            ),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ]
        )
      ),
    ),
  );
}
```

<img width="771" alt="스크린샷 2024-08-05 오전 12 34 23" src="https://github.com/user-attachments/assets/d8dc8c71-a03b-481e-b40d-b016ccde3148">

<br>
<br>

### StatelessWidget 선언해보기

- 한번 선언해 놓고 반복해서 계속 사용을 하고 싶다면 위젯을 직접 만들어서 사용하면 된다.
- stless 단축어를 사용해서 쉽게 템플릿을 작성할 수 있다.
- HotReload가 자동으로 실행되어 화면이 업데이트 된다.
    - build 함수 안에 있는 내용은 자동으로 업데이트

```dart
// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFfa8072),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/img/logo.png',
              ),
              CircularProgressIndicator(
                color: Colors.white,
              )
            ]
        )
    );
  }
}
```

<br>
<br>

### Padding 위젯 사용해보기 & Hot Reload 사용해보기

- 이전 강의 관련에도 작성되어 있듯이 build 함수 안에 있는 내용은 HotReload가 자동으로 실행되어 화면이 업데이트 된다.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) { // 이 안에 있는 내용은 저장시 자동 업데이트
    return Scaffold(
        backgroundColor: Color(0xFFfa8072),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/img/logo.png',
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                )
              ]
          ),
        )
    );
  }
}
```

<img width="771" alt="스크린샷 2024-08-05 오전 12 52 43" src="https://github.com/user-attachments/assets/8ac5a8ed-08a5-4f27-9d0e-0faaee918b33">

<br>
<br>

### SizedBox 위젯 사용해보기

- padding 대신에 height가 있는 박스를 넣어주는 형태

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFfa8072),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/img/logo.png',
                ),
                SizedBox(height: 28.0), // padding 대신에 height가 있는 박스를 넣어줌
                CircularProgressIndicator(
                  color: Colors.white,
                ),
              ]
          ),
        )
    );
  }
}
```

<img width="771" alt="스크린샷 2024-08-05 오전 12 58 56" src="https://github.com/user-attachments/assets/a4eaa090-d6db-492b-9ff7-df0573c5f631">

<br>
<br>