# [이론] Scrollable Widgets - GridView

### GridView

- ListView는 한 방향으로 스크롤되지만, GridView는 좌, 우, 위, 아래로 스크롤 가능
- 타일처럼 배치 가능
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
