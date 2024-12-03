# [이론] Scrollable Widgets - GridView

### GridView

- ListView는 한 방향으로 스크롤되지만, GridView는 좌, 우, 위, 아래로 스크롤 가능
- 타일처럼 배치 가능

<br>

### GridView.count

- GridView.count는 한번에 모든 아이템을 생성
- crossAxisSpacing : 수평 간격, mainAxisSpacing : 수직 간격

```dart
// 1. count - 한번에 다 그려냄
Widget renderCount() {
  return GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 12.0, // 수평 간격
    mainAxisSpacing: 12.0, // 수직 간격
    children: numbers
        .map((e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length],
              index: e,
            ))
        .toList(),
  );
}
```

![화면-기록-2024-12-02-오후-7 30 11](https://github.com/user-attachments/assets/770263a7-b648-41bb-80f6-fc8e25385433)

<img width="780" alt="스크린샷 2024-12-02 오후 7 33 12" src="https://github.com/user-attachments/assets/24063a24-e329-47e5-a62e-c14b98865910">

<br>
<br>

### GridView.builder - SliverGridDelegateWithFixedCrossAxisCount

- GridView.builder는 필요한 아이템만 생성
- builder에서는 itemCount를 지정할 수 있으며, 작성하지 않으면 무한 스크롤이 됨
- crossAxisCount : 좌우로 몇 개를 최대한 넣을지

```dart
// 2. builder - 보이는 것만 그려냄
Widget renderBuilderCrossAxisCount() {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // 좌우로 몇 개를 최대한 넣을지
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
    ),
    itemBuilder: (context, index) => renderContainer(
      color: rainbowColors[index % rainbowColors.length],
      index: index,
    ),
  );
}
```

<img width="747" alt="스크린샷 2024-12-03 오후 11 43 42" src="https://github.com/user-attachments/assets/c48a1b5c-271d-4dd7-b886-24b4449613e6">

![스크린샷 2024-12-03 오후 11 42 14](https://github.com/user-attachments/assets/9c5edc25-6c3c-439e-9859-e7a03e680e4f)

<br>
<br>

### GridView.builder - SliverGridDelegateWithMaxCrossAxisExtent

- maxCrossAxisExtent : 최대 너비 기준으로 여러 위젯들이 같은 사이즈의 공간을 차지할 수 있도록 자동으로 배치

```dart
// 3. 최대 사이즈 지정
Widget renderMaxExtent() {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 100.0, // 최대 사이즈
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
    ),
    itemBuilder: (context, index) => renderContainer(
      color: rainbowColors[index % rainbowColors.length],
      index: index,
    ),
  );
}
```

<img width="747" alt="스크린샷 2024-12-03 오후 11 50 16" src="https://github.com/user-attachments/assets/a5adc6ac-ef49-49b1-b92b-58a1149397e3">

<br>
<br>
