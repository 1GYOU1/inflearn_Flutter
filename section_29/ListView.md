# [이론] Scrollable Widgets - ListView

### ListView 기본 사용법 & builder 사용법

- 기본 사용법
  - 모든 아이템을 한 번에 생성
- builder 사용법
  - 필요한 아이템만 생성
  - 스크롤할 때마다 필요한 위젯만 생성

```dart
 // 기본 사용법
Widget renderDefault() {
  return ListView(
    children: numbers
        .map((e) => renderContainer(
            color: rainbowColors[e % rainbowColors.length], index: e))
        .toList(),
  );
}

// builder 사용법
Widget renderBuilder() {
  return ListView.builder(
    itemCount: 100,
    itemBuilder: (context, index) => renderContainer(
      color: rainbowColors[index % rainbowColors.length],
      index: index,
    ),
  );
}
```

![화면-기록-2024-11-28-오후-11 45 33](https://github.com/user-attachments/assets/99c618fe-1a0e-4b7b-86b8-be86c63a3e9d)

<br>

- renderDefault 실행(99까지 한벤에 출력) 후 renderBuilder 실행(스크롤 시 필요한 위젯만 출력) 터미널 출력하는 것을 확인할 수 있음

![스크린샷 2024-11-28 오후 11 47 43](https://github.com/user-attachments/assets/66a47b4e-3b8d-4a16-a7e7-45700d4caee3)

<br>
<br>

### ListView.separated

```dart

```