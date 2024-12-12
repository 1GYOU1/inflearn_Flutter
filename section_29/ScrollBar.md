# [이론] Scrollable Widgets - Scrollbar

### Scrollbar

- 스크롤 바를 표시해주는 위젯(default가 없는 상태)

```dart
class ScrollbarScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ScrollbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "ScrollbarScreen",
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: numbers
                .map((e) => renderContainer(
                    color: rainbowColors[e % rainbowColors.length], index: e))
                .toList(),
          ),
        ),
      ),
    );
  }

  // 위젯 렌더링
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

- 스크롤 바 표시

![화면-기록-2024-12-12-오후-11 54 56](https://github.com/user-attachments/assets/d1aff46a-8d5b-48bf-bb36-1883e6d4a00a)

