# [프로젝트] [★★★★☆] Calendar Scheduler (일정관리 앱)

### 프로젝트 소개

![Untitled-1](https://github.com/user-attachments/assets/b3d8d2de-0cfb-48bf-9efd-1bd6b1ff2522)

- Table Calendar 사용
  - 플러터에서 가장 많이 사용되는 캘린더 플러그인
- Drift 배우면서 SQL 배우기
- Dismissible
  - 스와이프 기능으로 삭제 액션 사용해보기
- Bottom Sheet
  - 버튼 클릭시 아래에서 위로 나타나는 새 창
- Form
  - 여러 개의 텍스트 필드를 다룰 수 있는 form

<br>
<br>

### Pubspec 파일 작업하기

- table_calendar 3.1.0 플러그인 사용
  - https://pub.dev/packages/table_calendar/versions/3.1.0

```yaml
// pubspec.yaml

table_calendar: ^3.1.0
```

- 폰트 추가

```yaml
// pubspec.yaml

  fonts:
    - family: NotoSans
      fonts:
        - asset: asset/fonts/NotoSansKR-Black.otf
          weight: 900
        - asset: asset/fonts/NotoSansKR-Bold.otf
          weight: 700
        - asset: asset/fonts/NotoSansKR-Medium.otf
          weight: 500
        - asset: asset/fonts/NotoSansKR-Regular.otf
          weight: 400
        - asset: asset/fonts/NotoSansKR-Light.otf
          weight: 300
        - asset: asset/fonts/NotoSansKR-Thin.otf
          weight: 100
```

<br>
<br>

### 달력에서 날짜 선택하기

- TableCalendar 생성
- TableCalendar의 필수 속성
  - focusedDay: 캘린더가 초점을 맞출 날짜
  - firstDay: 캘린더가 표시할 최소 날짜
  - lastDay: 캘린더가 표시할 최대 날짜
- 캘린더 날짜 선택 시 호출되는 함수
  - onDaySelected: 날짜 선택 시 호출
  - selectedDayPredicate: 선택된 날짜 표시

```dart
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // 캘린더 플러그인

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDay; // 선택된 날짜

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SafeArea(
          child: TableCalendar(
            // locale: 'ko_KR',
            focusedDay:
                DateTime(2024, 10, 1), // 캘린더가 초점을 맞출 날짜(해당 날짜 기준으로 한 달씩 보여줌)
            firstDay: DateTime(1800),
            lastDay: DateTime(3000),
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              // 날짜 선택 시 호출
              setState(() {
                this.selectedDay = selectedDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
              // 선택된 날짜 표시
              if (selectedDay == null) {
                return false;
              }
              return date.isAtSameMomentAs(selectedDay ?? DateTime.now());
            },
          ),
        ),
      ),
    );
  }
}
```

<br>
<br>

### 달력 스타일링하기

```dart

```

<br>
<br>