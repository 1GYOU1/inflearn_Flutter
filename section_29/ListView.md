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

- itemBuilder와 비슷하게 필요한 아이템만 생성
- separatorBuilder를 사용하여 아이템 사이에 구분자를 넣어줄 수 있다.
- 구분자는 마지막 아이템에는 적용되지 않음

```dart
  // 3. separated - 2번 + 중간 중간에 추가 위젯 넣기
  Widget renderSeparated() {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
      separatorBuilder: (context, index) {
        index += 1;
        // 5개의 item마다 배너 보여주기
        if (index % 5 == 0) {
          return renderContainer(
            color: Colors.black,
            index: index,
            height: 100,
          );
        }
        return SizedBox(height: 32);
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

<br>

- 5개의 아이템마다 검정 박스를 보여주는 것을 확인할 수 있음
- 박스마다 SizedBox를 사용하여 간격을 조절도 가능

![화면-기록-2024-12-01-오후-11 49 54](https://github.com/user-attachments/assets/1ac420db-8d83-488b-b4ba-83408d2f70a6)
