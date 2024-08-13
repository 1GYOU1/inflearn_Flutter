# [이론] StatefulWidget

### StatefulWidget

- 플러터는 화면에 보여지는 요소를 클래스로 표현하며, 이를 위젯이라 부른다.
- UI를 표현하는 위젯은 StatelessWidget, StatefulWidget 두가지가 존재한다.
    - 이 두가지는 굉장히 비슷하고, 표현하는 방식만 조금 다르다고 생각하면 된다.

<br>

**Widget Immutability**

- 위젯은 불변(Immutable) 법칙을 따른다.
- 무언가 변경될 때마다 삭제하고 새로운 위젯을 생성하는 방식이다.
    - 하단 이미지와 같이 빨간색 컨테이너를 변경할 수 없으니 아예 삭제하고, 파란색 컨테이너를 새로 생성하는 방식.

![Untitled-1](https://github.com/user-attachments/assets/b852f816-d042-454b-a70b-b638660f0b5a)

<br>

**StatelessWidget 색상 변경**

- Flutter 프레임워크가 만들어질 때, 맨 처음 앱이 실행될 때는 빌드가 두 번 연속 실행되도록 만들어졌다. 맨 처음 빌드가 아니면 한 번 실행되는게 정상이다.
- 빌드 함수는 화면에 보여주고 싶은 요소를 반환하면 된다.
- HotRestart 앱이 처음부터 다시 실행
- HotReload 화면에 보이는 모든 위젯들의 빌드 함수만 다시 실행
- StatefulWidget - setState : setState 함수를 실행하면 빌드 함수가 무조건 재실행된다.
- 결론 : **StatefulWidget - setState** 사용하여 화면이 변경되어야할 때 HotReload 함수 실행시켜줘야 함.

<br>
<br>

### StatefulWidget 실습

<br>
<br>

### StatefulWidget 생성해보기

<br>
<br>

### setState() 함수와 build() 함수의 관계

<br>
<br>