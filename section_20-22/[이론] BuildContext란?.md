# [이론] BuildContext란?

**결론 : BuildContext는 위젯 트리에서의 위젯의 위치 정보를 들고있다.**

- 위젯들이 서로 연결돼 있는 형태를 위젯트리라고 한다.

![Untitled-1](https://github.com/user-attachments/assets/94b2201c-53be-4736-b110-04696ff05b16)

<br>

- StatelessWidget과 StatefulWidget은 모두 Widget을 상속 받는데, Widget 클래스의 정의에는 createElement() 함수가 있다.
    - 위젯 자체는 위치 정보를 들고 있지 않는다.
    - Widget 클래스 안으로 들어가보면 정의되어 있다.

![Untitled-1](https://github.com/user-attachments/assets/9d880d4e-d10c-4fad-819e-6ebc90e53f36)

![Untitled-1](https://github.com/user-attachments/assets/e3c88eae-d406-424e-ad82-d405f682cd7f)


<br>

- createElement()는 Element를 만드는 역할을 한다.

![Untitled-1](https://github.com/user-attachments/assets/9add0363-38ca-4f0e-b07a-398699d1a767)

<br>

- Element는 BuildContext이다.
    - Element의 정의로 가보면 Element는 BuildContext에 들어가는 모든 기능들을 다 구현해야한다고 되어있다.

![Untitled-1](https://github.com/user-attachments/assets/93f5f10c-06ef-4c2f-a46e-310ff7cf254e)

<br>

- Element는 Widget에 대한 정보, 부모에 대한 정보, 자식에 대한 정보, 크기 등 위젯에 대한 정보를 전부 갖고 있다.

- 미디어 쿼리, Navigator에 buildContext 파라미터를 넣어준 이유는 위젯 트리에 대한 정보를 알고 있어야지만 특정 값들을 반환해줄 수 있는 기능이기 때문이다.