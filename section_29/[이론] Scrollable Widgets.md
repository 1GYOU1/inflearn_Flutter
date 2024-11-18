# [이론] Scrollable Widgets

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

### AlwaysScrollableScrollPhysics - 강제 스크롤 가능

```dart
// 

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
<br>

- 적용 전

![화면-기록-2024-11-18-오후-11 52 31](https://github.com/user-attachments/assets/70d77711-e81b-4b98-9d3c-ac8d337c50be)

- 적용 후

![화면-기록-2024-11-18-오후-11 52 49](https://github.com/user-attachments/assets/d0e2ab03-09a3-406c-a5e0-bf97579e9a95)

<br>
<br>

### ListView

<br>
<br>