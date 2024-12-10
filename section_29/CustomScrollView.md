# [이론] Scrollable Widgets - CustomScrollView

### CustomScrollView - List

- 여러 개의 스크롤 가능한 위젯들을 한 위젯에 집어넣을 수 있는 기능
  - ex) ListView, GridView를 한 위젯에 집어넣어서 스크롤이 동시에 되는 형태로 구현 가능
- 모든 리스트 또는 스크롤 가능한 위젯들은 Column 위젯 안에 넣었을 때 Expanded 위젯 안에 넣어야 함. 안넣으면 에러 발생

<br>

### 1. CustomScrollView - SliverList

- 한 번에 모든 위젯 렌더링

```dart
SliverList renderSliverList() {
  return SliverList(
    delegate: SliverChildListDelegate(
      numbers
          .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ))
          .toList(),
    ),
  );
}
```

<br>

### 2. CustomScrollView - SliverList - builder

- 필요한 위젯만 렌더링

```dart
SliverList renderSliverList() {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) => renderContainer(
        color: rainbowColors[numbers[index] % rainbowColors.length],
        index: numbers[index],
      ),
      childCount: numbers.length,
    ),
  );
}
```

<img width="747" alt="스크린샷 2024-12-10 오후 11 27 10" src="https://github.com/user-attachments/assets/32a0f386-822d-420a-9a4d-d2ddd56d1d07">

<br>
<br>

### CustomScrollView - Grid

### 1. CustomScrollView - SliverGrid

- GridView.count 유사한 형태

```dart
// GridView.count 유사함.
SliverGrid renderChildSliverGrid() {
  return SliverGrid(
    delegate: SliverChildListDelegate(
      numbers
          .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ))
          .toList(),
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // 열 개수
    ),
  );
}
```

<img width="747" alt="스크린샷 2024-12-10 오후 11 23 52" src="https://github.com/user-attachments/assets/e17238a7-3081-4b29-b74d-8b665e6b3543">


<br>

### 2. CustomScrollView - SliverGrid - builder

- GridView.builder 와 유사함.
- 필요한 위젯만 렌더링

```dart
// GridView.builder 유사함.
SliverGrid renderSliverGridBuilder() {
  return SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (context, index) => renderContainer(
        color: rainbowColors[numbers[index] % rainbowColors.length],
        index: index,
      ),
      childCount: 100,
    ),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 150, // 하나의 위젯이 최대한으로 차지할 수 있는 픽셀만큼 크기를 정함
    ),
  );
}
```

<img width="747" alt="스크린샷 2024-12-10 오후 11 46 16" src="https://github.com/user-attachments/assets/ad2d2390-1cb1-4f02-ac3d-caba8b0314f6">

