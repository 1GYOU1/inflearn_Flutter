# [이론] Scrollable Widgets

### SingleChildScrollView

- 가장 기본적인 스크롤 위젯, default는 스크롤이 안되는 상태이고, 화면을 넘어가게되면 스크롤이 되는 형태이다.
- physics로 강제 스크롤 가능 여부 제어를 할 수 있다.
- physics 프로퍼티로 스크롤 동작 제어
  - NeverScrollableScrollPhysics : 스크롤 금지(default)
  - AlwaysScrollableScrollPhysics : 강제 스크롤 가능
  - BouncingScrollPhysics : 바운스 효과 추가
  - ClampingScrollPhysics : Android style, 상단 스크롤시 땡겨지지 않음
  - NeverScrollableScrollPhysics : 스크롤 안됨
  
- 높이가 작은 위젯에서 스크롤 가능하게 하고 싶을 때 화면 잘림 현상은 clipBehavior 프로퍼티로 제어할 수 있다.
- clipBehavior 프로퍼티로 스크롤 범위 제한 여부 제어
  - Clip.none : 스크롤 시 잘리지 않음
  - Clip.antiAlias : 스크롤 시 잘림
  - Clip.antiAliasWithSaveLayer : 스크롤 시 잘림
  - Clip.hardEdge : 스크롤 시 잘림

```dart

```
<br>
<br>

### ListView

<br>
<br>