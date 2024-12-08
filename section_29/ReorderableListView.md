# [이론] Scrollable Widgets - Reorderable ListView

### ReorderableListView

- 위젯을 드래그 앤 드롭으로 재정렬할 수 있는 위젯
- stateful widget으로 구현
- 키값을 지정해줘야 함

```dart
Widget renderDefault() {
    return ReorderableListView(
      children: numbers
          .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ))
          .toList(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          // oldIndex와 newIndex 모두
          // 이동이 되기 전에 산정한다.
          //
          //
          // [red, orange, yellow]
          // [0, 1, 2]
          //
          // red를 yellow 다음으로 옮기고싶다.
          // red : 0 oldIndex => 3 newIndex
          // [orange, yellow, red]
          //
          // [red, orange, yellow]
          // yellow를 맨 앞으로 옮기고싶다.
          // yellow : 2 oldIndex => 0 newIndex
          // [yellow, red, orange]
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }

          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex, item);
        });
      },
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
      key: Key(index.toString()), // 키값 지정
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
```

![화면-기록-2024-12-05-오후-10 29 20](https://github.com/user-attachments/assets/445046c2-0e13-4cce-987d-f7ef7b85079b)

<br>
<br>


### ReorderableListView.builder

- 효율적인 렌더링을 위해 사용
  - 로드 시 모든 위젯을 렌더링하는 것이 아니라, 보이는 위젯만 렌더링

```dart
// 위젯 렌더링 - builder
Widget renderBuilder() {
  return ReorderableListView.builder(
    itemBuilder: (context, index) => renderContainer(
      color: rainbowColors[numbers[index] % rainbowColors.length],
      index: numbers[index],
    ),
    itemCount: numbers.length,
    onReorder: (int oldIndex, int newIndex) {
      setState(() {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = numbers.removeAt(oldIndex); // 기존 위젯 삭제
        numbers.insert(newIndex, item); // 새로운 위치에 위젯 삽입
      });
    },
  );
}
```