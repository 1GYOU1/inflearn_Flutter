# [이론] Constraint

### 이론

- Single Pass : 한번만 계산
- Constranints Go Down : 위에서 아래로 내려간다
- Sizes Go Up : 크기는 위로 올라간다
- Parent Sets Position : 부모가 위치를 정한다

<br>

- Constraint는 크기의 제약을 말한다. 네 개의 값으로 정해져있다.
1) Max Height
2) Min Height
3) Max Width
4) Min Width

<br>

![Untitled-1-Recovered](https://github.com/user-attachments/assets/2e8d0b80-f559-40da-a7f1-aae22d84dc07)

![Untitled-1-Recovered](https://github.com/user-attachments/assets/806c6d0a-c4b7-4ce7-add4-2383958d34fb)

![Untitled-1-Recovered](https://github.com/user-attachments/assets/642add05-0ceb-4160-92de-00095a9023ae)

**제한 사항**
- 자식 위젯은 부모 위젯이 제한하고 있는 constraint 내부에서만 크기를 가져갈 수 있다.
- 위젯의 위치는 부모 위젯이 지정하기 때문에 위젯은 자신이 정확히 어디에 위치될지 알 수 없다.(플러터에서 x, y 좌표로 위젯을 배치하지 않는 이유)
- 자식 위젯이 어디에 정렬돼야하는지 정확히 알 수 없는 경우에는 자식 위젯의 크기가 무시 될 수 있다.

<br>

### 실습

- 자식 요소에 정렬을 주지 않으면 width, height 안먹음.

![Untitled-1-Recovered](https://github.com/user-attachments/assets/8e55e404-5c22-4ab5-8be2-646e8f52d2ef)

<br>

- Center로 정렬을 줬더니 width, height가 먹힘

![Untitled-1-Recovered](https://github.com/user-attachments/assets/500cbb91-2c6b-4231-bb2a-044844f04410)

<br>

- Column(위에서 아래로), Row(좌에서 우로)는 정렬에 대한 정의가 되어있기 때문에 width, height 먹힘

![Untitled-1-Recovered](https://github.com/user-attachments/assets/b77e6723-5b4c-47c6-be6f-df0e3dd7c7c4)

![Untitled-1-Recovered](https://github.com/user-attachments/assets/8fcc4fc6-4580-475d-ab62-eee52d9b7666)