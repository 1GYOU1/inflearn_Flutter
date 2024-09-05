# [이론] Alignment

### Alignment 위젯 정복하기

- Center, Column, Row 위젯이 아닌, Align에 alignment: Alignment 위젯을 사용하여 정렬
- 하단 이미지와 같이 옵션 값으로 정렬이 가능하다.
    - center
    - bottomCenter
    - bottomLeft
    - bottomRight
    - centerLeft
    - centerRight
    - topCenter
    - topLeft
    - topRight
```dart
child: Align(
    alignment: Alignment.center,
    child: Container(
    //...
)
```

![Untitled-1-Recovered](https://github.com/user-attachments/assets/24f0a303-f9ce-4491-86de-292844700e1f)

<br>

- x, y의 좌표값을 사용해서 좀 더 세세하게 정렬하기
    - 0, 0 : center
    - 1, 0 : centerRight
    - -1, 0 : centerLeft
    - 0, 1 : bottomCenter
    - 0, -1 : topCenter
    - 등,,,
```dart
child: Align(
    alignment: Alignment(
        0, 0 // center
    ),
    child: Container(
    //...
)
```

![Untitled-1-Recovered](https://github.com/user-attachments/assets/dc3356e2-3f8b-4425-ac3a-0178360cea69)
