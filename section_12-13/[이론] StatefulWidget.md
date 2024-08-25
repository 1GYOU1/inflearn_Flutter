# [이론] StatefulWidget

### StatefulWidget

- 플러터는 화면에 보여지는 요소를 클래스로 표현하며, 이를 위젯이라 부른다.
- UI를 표현하는 위젯은 StatelessWidget, StatefulWidget 두가지가 존재한다.
    - 이 두가지는 굉장히 비슷하고, 표현하는 방식만 조금 다르다고 생각하면 된다.

<br>

### Widget Immutability

- 위젯은 불변(Immutable) 법칙을 따른다.
- 무언가 변경될 때마다 삭제하고 새로운 위젯을 생성하는 방식이다.
    - 하단 이미지와 같이 빨간색 컨테이너를 변경할 수 없으니 아예 삭제하고, 파란색 컨테이너를 새로 생성하는 방식.

![Untitled-1](https://github.com/user-attachments/assets/b852f816-d042-454b-a70b-b638660f0b5a)

<br>

### StatelessWidget 색상 변경

- Flutter 프레임워크가 만들어질 때, 맨 처음 앱이 실행될 때는 빌드가 두 번 연속 실행되도록 만들어졌다. 맨 처음 빌드가 아니면 한 번 실행되는게 정상이다.
- 빌드 함수는 화면에 보여주고 싶은 요소를 반환하는 기능이다.
- StatefulWidget - setState : setState 함수를 실행하면 빌드 함수가 무조건 재실행된다.
- 결론 : **StatefulWidget - setState** 사용하여 화면이 변경되어야할 때 HotReload 함수 실행시켜줘야 함.

![Untitled-1](https://github.com/user-attachments/assets/e1f11f03-508e-4458-b31b-bd0af5d03eda)

<br>

- HotRestart 또는 HotReload 사용하여 build를 다시하지 않으면 업데이트 된 화면이 보이지 않음.
- HotRestart - 앱을 처음부터 다시 실행
- **HotReload** - 화면에 보이는 모든 위젯들의 빌드 함수만 다시 실행

![Untitled-２](https://github.com/user-attachments/assets/1807815a-7a47-40b5-856e-7f02807c17a3)

<br>

### StatelessWidget과 StatefulWidget의 차이
- StatelessWidget은 클래스 하나로 이루어져있고, StatefulWidget은 state라는 클래스를 상속 받아 연동이 된다.
    - StatefulWidget을 상속받은 클래스에서 createState라는 함수를 무조건 정의하게 되어있는데, 여기에서 State 클래스의 인스턴스를 반환해준다.
    - 무조건 암기 ~
- StatefulWidget을 상속받는 클래스에는 빌드 함수가 존재하지 않는다.

![Untitled-２](https://github.com/user-attachments/assets/7cc5155c-471a-451a-82a1-83ca207cf1a7)

<br>

- StatefulWidget을 선언하게되면 state<클래스> 상속받았을 때, setState라는 함수를 사용할 수 있게된다.
    - setState는 state 클래스 안에 정의가 이미 되어있음.
    - setState -> 빌드 함수를 다시 실행하라는 명령 함수

![Untitled-３](https://github.com/user-attachments/assets/1704c3e5-7339-464d-9323-ddc8fb303bf8)


<br>
<br>

### StatefulWidget 실습 & 생성해보기 & 빌드 함수와의 관계

- StatefulWidget, setState 사용하여 버튼 클릭시 자동으로 빌드 함수가 다시 실행되어 박스 컬러가 바뀌게 만들어보기
- 버튼 클릭시 터미널에 setState 함수 실행과 빌드 실행 문구가 출력되는 것을 볼 수 있음.

![스크린샷 2024-08-15 오후 8 53 39](https://github.com/user-attachments/assets/b985491d-9bb9-402b-a44b-70d9846b49b9)

```dart
// lib/screen/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    print('빌드 실행 !'); // 빌드 실행 확인 문구

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ElevatedButton(onPressed: (){
            if(color == Colors.blue){
              color = Colors.red;
            }else{
              color = Colors.blue;
            }

            print('색상 변경 : color: $color'); // 색상 변경 확인 문구

            setState((){});

          }, child: Text(
            '색상 변경!', // 버튼 문구
          ),
          ),
            const SizedBox(height:32.0),
            Container(
              width:50.0,
              height:50.0,
              color: color,
            )
          ],
        ),
      ),
    );
  }
}
```

<img width="822" alt="스크린샷 2024-08-15 오후 8 54 52" src="https://github.com/user-attachments/assets/d00048ad-a1c5-4f40-aa7d-7de46ab187ab">

<br>
<br>


### 에러

아무것도 안건드렸는데 안드로이드 애뮬레이터 실행시 하단과 같은 오류가 남,,,

```
[INSTALL_FAILED_INSUFFICIENT_STORAGE: Failed to override installation location]
```

<br>

### 해결

Show Advanced Settings 클릭 후, storage 넉넉하게 변경하라는 글이 많았지만 <br>
나는 이미 넉넉하게 변경해둔 상태라서 Wipe data 클릭해서 해결했다.

![스크린샷 2024-08-15 오후 8 29 46](https://github.com/user-attachments/assets/0c2582f5-9be7-4940-9e15-2c0b2b01cc8f)