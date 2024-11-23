# [이론] Scrollable Widgets - SingleChildScrollView

### SingleChildScrollView

- 가장 기본적인 스크롤 위젯, default는 스크롤이 안되는 상태이고, 화면을 넘어가게되면 스크롤이 되는 형태이다.
- 위젯을 미리 랜더링하기 때문에 위젯들이 리소스를 많이 잡아먹는 경우 사용을 지양하는 것이 좋다.
- physics로 강제 스크롤 가능 여부 제어를 할 수 있다.
- physics 프로퍼티로 스크롤 동작 제어
  - NeverScrollableScrollPhysics : 스크롤 금지(default), 스크롤 안됨
  - AlwaysScrollableScrollPhysics : 강제 스크롤 가능
  - BouncingScrollPhysics : iOS style, 바운스 효과 추가
  - ClampingScrollPhysics : Android style, 상단 스크롤시 땡겨지지 않음
  
- 높이가 작은 위젯에서 스크롤 가능하게 하고 싶을 때 화면 잘림 현상은 clipBehavior 프로퍼티로 제어할 수 있다.
- clipBehavior 프로퍼티로 스크롤 범위 제한 여부 제어
  - Clip.none : 스크롤 시 잘리지 않음
  - Clip.antiAlias : 스크롤 시 잘림
  - Clip.antiAliasWithSaveLayer : 스크롤 시 잘림
  - Clip.hardEdge : 스크롤 시 잘림

<br>

### physics: AlwaysScrollableScrollPhysics - 강제 스크롤 가능

```dart
class SingleChildScrollViewScreen extends StatelessWidget {
  const SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "SingleChildScrollView",
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // 강제 스크롤 가능
        child: Column(
          children: [renderContainer(color: Colors.black)],
        ),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
  }) {
    return Container(
      height: 300,
      color: color,
    );
  }
}
```
<br>

- 적용 전

![화면-기록-2024-11-18-오후-11 52 31](https://github.com/user-attachments/assets/70d77711-e81b-4b98-9d3c-ac8d337c50be)

- 적용 후

![화면-기록-2024-11-18-오후-11 52 49](https://github.com/user-attachments/assets/d0e2ab03-09a3-406c-a5e0-bf97579e9a95)

<br>
<br>

### physics: NeverScrollableScrollPhysics - 스크롤 금지

```dart
class SingleChildScrollViewScreen extends StatelessWidget {
  const SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "SingleChildScrollView",
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children:
              rainbowColors.map((e) => renderContainer(color: e)).toList(),
        ),
      ),
    );
  }
  // 위젯 렌더링
  Widget renderContainer({
    required Color color,
  }) {
    return Container(
      height: 300,
      color: color,
    );
  }
}
```

- 적용 전

![화면-기록-2024-11-20-오후-11 48 11](https://github.com/user-attachments/assets/037c11ea-2638-4867-9127-bc2b5bb5cebb)

- 적용 후

![화면-기록-2024-11-20-오후-11 48 45](https://github.com/user-attachments/assets/ea1bb1ce-268c-4c91-b6a2-36b5abdbed6b)

<br>
<br>

### clipBehavior - 위젯이 잘리지 않게 하기

```dart
class SingleChildScrollViewScreen extends StatelessWidget {
  const SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "SingleChildScrollView",
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [renderContainer(color: Colors.black)],
        ),
      ),
    );
  }
  // 위젯 렌더링
  Widget renderContainer({
    required Color color,
  }) {
    return Container(
      height: 300,
      color: color,
    );
  }
}
```

- 적용 전

![화면-기록-2024-11-18-오후-11 52 49](https://github.com/user-attachments/assets/d0e2ab03-09a3-406c-a5e0-bf97579e9a95)

- 적용 후

![화면-기록-2024-11-21-오전-12 00 19](https://github.com/user-attachments/assets/620284d7-d22f-4296-bede-6f3e934a8610)

<br>
<br>

### 여러가지 physics

```dart
class SingleChildScrollViewScreen extends StatelessWidget {
  const SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "SingleChildScrollView",
      body: SingleChildScrollView(
      // NeverScrollableScrollPhysics() - 스크롤 안됨
      // AlwaysScrollableScrollPhysics() - 스크롤 됨
      // BouncingScrollPhysics() - iOS style, 바운스 효과 추가
      // ClampingScrollPhysics() - Android style, 상단 스크롤시 땡겨지지 않음
      physics: ClampingScrollPhysics(),
        child: Column(
          children: rainbowColors.map((e) => renderContainer(color: e)).toList(),
        ),
      ),
    );
  }
  // 위젯 렌더링
  Widget renderContainer({
    required Color color,
  }) {
    return Container(
      height: 300,
      color: color,
    );
  }
}
```

- BouncingScrollPhysics 적용

![화면-기록-2024-11-21-오전-12 35 28](https://github.com/user-attachments/assets/b8bf17b6-5930-4e78-8ed4-cb09307ef325)

- ClampingScrollPhysics 적용 (상단 스크롤시 땡겨지지 않음)

![화면-기록-2024-11-21-오전-12 35 53](https://github.com/user-attachments/assets/87a66b59-ea9a-4ce9-8743-3a39c4155246)

<br>
<br>

### List.generate

- 여러 개의 리스트를 쉽게 만들 수 있는 방법

사용 예시
```dart
List.generate(
    개수,           // 생성할 아이템 개수
    (index) => 값   // 각 인덱스별로 생성할 값
);

// 0부터 4까지의 숫자 리스트 생성
final numbers = List.generate(5, (index) => index);
print(numbers);  // [0, 1, 2, 3, 4]

// 2의 배수 리스트 생성
final multiples = List.generate(5, (index) => index * 2);
print(multiples);  // [0, 2, 4, 6, 8]
```

```dart
class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index,
  );

  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(numbers); // 하단 이미지 터미널 참고

    return MainLayout(
      //...
```

![스크린샷 2024-11-21 오전 12 07 25](https://github.com/user-attachments/assets/cc34c930-9a62-4951-9b02-1fc9487f855e)

<br>
<br>

### SingleChildScrollView 퍼포먼스

- 위젯을 미리 렌더링 한다는 것을 증명하는 예제

```dart
class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index,
  );

  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(numbers);

    return MainLayout(
      title: "SingleChildScrollView",
      body: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: numbers
            .map(
              (e) => renderContainer( // 100개의 위젯을 렌더링 하고 있음.
                color: rainbowColors[e % rainbowColors.length], // 나머지 연산으로 색상 순환 반복
                index: e,
              ),
            )
            .toList(),
        ),
      ),
    );
  }
  // 위젯 렌더링
  Widget renderContainer({
    required Color color,
    int? index,
  }) {
    if (index != null) {
      print(index); // 터미널에 0~99까지 출력되고 있음.
    }
    return Container(
      height: 300,
      color: color,
    );
  }
}
```

- 터미널에 0~99까지 이미 출력되어 있고, 100개의 위젯을 한번에 렌더링 한다는 것을 알 수 있음.

![화면-기록-2024-11-21-오전-12 29 00](https://github.com/user-attachments/assets/139c6ae0-a0ef-4565-bb9f-fd4a989b96de)

![스크린샷 2024-11-21 오전 12 31 15](https://github.com/user-attachments/assets/517959c3-def5-4964-ae69-308e9e39d776)
