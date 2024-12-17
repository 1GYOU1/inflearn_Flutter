# [이론] Scrollable Widgets - RefreshIndicator

### RefreshIndicator

- 최상단 땡겨서 새로고침하는 동작을 위한 위젯이다.
- 하단 예시 코드는 최상단에서 새로고침하면 상단에 리프레시 인디케이터가 표시된다.

```dart
class RefreshIndicatorScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  RefreshIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "RefreshIndicatorScreen",
      body: RefreshIndicator(
        onRefresh: () async {
          // 서버 요청 영역
          await Future.delayed(Duration(seconds: 3));
        },
        child: ListView(
          children: numbers
              .map((e) => renderContainer(
                    color: rainbowColors[e % rainbowColors.length],
                    index: e,
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
      key: Key(index.toString()),
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
```

![화면-기록-2024-12-18-오전-12 01 38](https://github.com/user-attachments/assets/32b6bbc3-55aa-4c7e-bd78-5a9578dd0937)
