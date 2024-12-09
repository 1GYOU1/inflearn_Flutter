# [이론] Scrollable Widgets - CustomScrollView

## CustomScrollView - List

- 여러 개의 스크롤 가능한 위젯들을 한 위젯에 집어넣을 수 있는 기능
  - ex) ListView, GridView를 한 위젯에 집어넣어서 스크롤이 동시에 되는 형태로 구현 가능
- 모든 리스트 또는 스크롤 가능한 위젯들은 Column 위젯 안에 넣었을 때 Expanded 위젯 안에 넣어야 함. 안넣으면 에러 발생

<br>

### CustomScrollView - SliverList

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

### CustomScrollView - SliverList - builder

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

<br>
<br>

## CustomScrollView - Grid

- 