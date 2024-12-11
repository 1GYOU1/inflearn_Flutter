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

<br>
<br>

### CustomScrollView Appbar

- 

```dart  
// AppBar
SliverAppBar renderSliverAppBar() {
  return SliverAppBar(
    // 스크롤 했을 때 리스트의 중간에도 AppBar가 내려오게 할 수 있음. 
    // false 일 때는 최상단까지 스크롤을 해야 AppBar가 보임.
    floating: false,

    // 완전 고정 (css의 position: fixed)
    pinned: false,

    // 자석 효과
    // floating: true에만 사용 가능.
    snap: true,

    // 맨 위에서 한계 이상으로 스크롤 했을 때 남는 공간을 차지
    stretch: true,
    
    expandedHeight: 200, // 확장된 최대 높이
    collapsedHeight: 150, // 축소된 최소 높이

    // AppBar 배경 이미지 설정, 스크롤 시 자연스럽게 이미지 사라지는 효과
    flexibleSpace: FlexibleSpaceBar(
      background: Image.asset(
        "asset/img/image_1.jpeg",
        fit: BoxFit.cover,
      ),
      title: Text("FlexibleSpace"),
    ),

    title: Text("CustomScrollViewScreen"),
  );
}
```

- floating: true
  - 스크롤 했을 때 리스트의 중간에도 AppBar가 내려오게 할 수 있음.
  - false 일 때는 최상단까지 스크롤을 해야 AppBar가 보임.

![화면-기록-2024-12-11-오후-11 35 50](https://github.com/user-attachments/assets/7466b74f-e028-44d7-a455-f5a6bf5de887)

<br>

- pinned: true
  - 완전 고정 (css의 position: fixed)

![화면-기록-2024-12-11-오후-11 39 01](https://github.com/user-attachments/assets/8c1445ec-a18f-4939-8fd7-ca9930ea120e)

<br>

- snap: true
  - 스크롤하는 방향에 따라 자석 효과가 나타남.
  - floating: true에만 사용 가능.
- snap: false
  - 자석 효과 중간에 멈출 수 있음.

![화면-기록-2024-12-11-오후-11 42 09](https://github.com/user-attachments/assets/d8609078-5586-4e8e-887e-4941a9c8fb11)

<br>

- stretch: true
  - 맨 위에서 한계 이상으로 스크롤 했을 때 남는 공간을 appbar가 늘어나면서 차지
  - ios 에서만 적용됨. aos 에서는 원래 안보이는 형태임.

![화면-기록-2024-12-11-오후-11 48 34](https://github.com/user-attachments/assets/e94979a2-e8b1-4b9a-aedf-071ca6159120)

<br>

- flexibleSpace - background 이미지 설정

![무제 (1)](https://github.com/user-attachments/assets/2010010d-b10c-4814-abc0-ef0e95d6400c)

