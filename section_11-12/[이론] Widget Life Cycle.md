# [이론] Widget Life Cycle

### StatelessWidget 라이프 사이클 이론

- 위젯 라이프사이클이란, 위젯이 화면에 나타나는 순간부터 화면에서 사라지는 순간까지 어떤 일들이 일어나는지를 코드로 정의해 놓은 것이다. (특정 함수들이 어떤 순간에 실행이 되도록 만들어 놓은 것)
- 생성자 실행 -> 빌드 실행 순으로 실행됨.
- 여러개의 생성자가 있어도 생성자 실행 -> 빌드 실행 이 과정을 진행해서 위젯을 화면에다가 그려내는 방식. 

![Untitled-1](https://github.com/user-attachments/assets/6630150e-f207-4ec3-a2cb-13c648ea47d1)

<br>
<br>

### StatelessWidget 라이프 사이클 실습

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CodeFactoryWidget(),
    );
  }
}

class CodeFactoryWidget extends StatelessWidget {
  CodeFactoryWidget({super.key}){ // 생성자 호출
   print('--- 생성자 ---');
  }

  @override
  Widget build(BuildContext context) { // 빌드 함수
    print('--- 빌드 ---');

    return Container(
      width: 50.0,
      height: 50.0,
      color: Colors.red,
    );
  }
}
```

![스크린샷 2024-08-17 오후 7 11 20](https://github.com/user-attachments/assets/fc9739fe-07f7-480e-bfe1-dd7351f54c5e)

<br>
<br>

### StatefulWidget 라이프 사이클 이론

- 라이프사이클 중에서 어떤 특정 상황에 특정 함수나 기능들을 실행시키고 싶을때, 변경을 줄 수 있도록 라이프사이클 구간에 이 함수들을 정의해서 제공해줌.

![Untitled-1](https://github.com/user-attachments/assets/0c96782b-817c-47e3-89b8-6a42125c1014)

<br>

### StatefulWidget 라이프 사이클 이론 1

1. Constructor() 생성자 실행
2. createState() 실행
    - StatefulWidget은 createState() 함수를 정의하도록 되어있으며, 정의하지 않을시 에러가 남
    - createState() 함수는 클래스를 생성하고 initState() 함수 실행
3. initState() 함수 실행 
    - initState라는 함수는 state 클래스가 인스턴스화가 됐을 때 절대적으로 **한 번만 실행**이 된다.(constructor와 거의 똑같은 기능이라고 생각해도 됨)
4. initState 다음에 didChangeDependencies() 함수가 바로 실행됨.
    - didChangeDependencies() 함수는 build함수의 파라미터로 받을 수 있는 **context**를 사용할 수 있게 해줌.
    - initState는 context 사용 X
    ```dart
    //...
    Widget build(BuildContext context){ -> 이 부분
        return Container(
            //...
        )
    }
    ```
    - initState는 딱 한 번만 실행 가능하지만, didChangeDependencies는 Theme.of(), MediaQuery.of() (테마 변경, 화면에 대한 정보 변경) 값들이 변경이 됐을 때 함수를 다시 실행할 수 있다.
5. dirty 
6. build 
7. clean
    - dirty와 clean은 state 클래스의 상태를 말하는데, 실제로 확인하거나 사용하지는 않고, 이론적으로 적혀 있다고 함.
    - 빌드가 실행되어야하는 상태는 dirty 상태고, 빌드의 실행이 끝난 상태는 clean이다.

8. deactivate()
9. dispose()
    - state가 삭제되는 일이 생겼을 때 실행되는데, deactivate() 함수는 거의 사용하지 않음.

<br>

- 빨강 - 생성, 초록 - 삭제

![Untitled-1](https://github.com/user-attachments/assets/efb3eef7-c47c-4866-8c21-5486abd0d4fe)

<br>

### StatefulWidget 라이프 사이클 이론 2 - setState 사용

- 1~7번까지는 상단과 동일한 과정을 거침.

8. 

![Untitled-1](https://github.com/user-attachments/assets/1fe011cf-157c-4f7a-a93f-d7fdf91029bd)

![Untitled-1](https://github.com/user-attachments/assets/23381a06-b48c-4e02-9a42-0a7269b03148)

<br>

### StatefulWidget 라이프 사이클 이론 3

![Untitled-1](https://github.com/user-attachments/assets/f7c8522f-6a82-4c06-b0dd-f247e64684c6)

<br>
<br>

### StatefulWidget 라이프 사이클 실습 세팅하기

<br>
<br>

### StatefulWidget Life Cycle 실습 - 1

<br>
<br>

### StatefulWidget Life Cycle 실습 - 2

<br>
<br>

### StatefulWidget Life Cycle 실습 - 3

<br>
<br>
