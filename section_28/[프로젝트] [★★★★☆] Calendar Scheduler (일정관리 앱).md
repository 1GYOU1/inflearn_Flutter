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

- 캘린더 스타일 변경
- 스타일 변수로 만들어서 공통으로 사용
- copyWith: 기존 스타일에 새로운 스타일 추가
- 선택한 날짜에 borderRadius가 적용되어있다면, 외부 날짜(다른 달) 박스 스타일에도 borderRadius가 적용되어있어야 함. (오류 해결)

```dart
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar_scheduler/const/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    final defaultBoxDecoration = BoxDecoration( // 기본 박스 스타일
      borderRadius: BorderRadius.circular(6.0),
      border: Border.all(
        color: Colors.grey[200]!,
        width: 1.0,
      ),
    );

    final defaultTextStyle = TextStyle( // 기본 텍스트 스타일
      color: Colors.grey[600]!,
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
      body: SafeArea(
        child: SafeArea(
          child: TableCalendar(
            // locale: 'ko_KR',
            focusedDay:
                DateTime(2024, 10, 1),
            firstDay: DateTime(1800),
            lastDay: DateTime(3000),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true, // 오늘 날짜 하이라이트
              defaultDecoration: defaultBoxDecoration, // 기본 박스 스타일
              weekendDecoration: defaultBoxDecoration, // 주말 박스 스타일
              selectedDecoration: defaultBoxDecoration.copyWith( // 선택된 날짜 박스 스타일
                // copyWith: 기존 스타일에 새로운 스타일 추가
                border: Border.all(
                  color: primaryColor,
                  width: 1.0,
                ),
              ),
              todayDecoration: defaultBoxDecoration.copyWith( // 오늘 날짜 박스 스타일
                color: primaryColor,
              ),
              outsideDecoration: defaultBoxDecoration.copyWith( // 외부 날짜(다른 달) 박스 스타일
                border: Border.all(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              defaultTextStyle: defaultTextStyle, // 기본 텍스트 스타일
              weekendTextStyle: defaultTextStyle, // 주말 텍스트 스타일
              selectedTextStyle: defaultTextStyle.copyWith( // 선택된 날짜 텍스트 스타일
                color: primaryColor,
              ),
            ),
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              setState(() {
                this.selectedDay = selectedDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
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

### Intl 패키지 사용해서 언어 한국어로 변경하기

- https://pub.dev/packages/intl

```yaml
// pubspec.yaml

intl: ^0.19.0
```

<br>

- main.dart 앱 시작시 자동으로 날짜 포맷을 초기화

```dart
// main.dart

import 'package:flutter/material.dart';
import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

```
<br>

- locale 추가

```dart
// home_screen.dart

//...
return Scaffold(
      body: SafeArea(
        child: SafeArea(
          child: TableCalendar(
            locale: 'ko_KR', // 캘린더 언어 변경
            focusedDay:DateTime(2024, 10, 1),
            firstDay: DateTime(1800),
            lastDay: DateTime(3000),
//...
```

<br>
<br>

### 캘린더 컴포넌트 리팩터링하기

- Calendar.dart 파일 생성하여 컴포넌트 분리
- onDaySelected, selectedDayPredicate 외부로 빼서 관리

```dart
// calendar.dart

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar_scheduler/const/color.dart';

class Calendar extends StatelessWidget {
  final DateTime focusedDay; // 추가
  final OnDaySelected onDaySelected; // 추가
  final bool Function(DateTime day) selectedDayPredicate; // 추가

  const Calendar(
      {super.key,
      required this.focusedDay, // 추가
      required this.onDaySelected, // 추가
      required this.selectedDayPredicate}); // 추가

  @override
  Widget build(BuildContext context) {
    final defaultBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      border: Border.all(
        color: Colors.grey[200]!,
        width: 1.0,
      ),
    );

    final defaultTextStyle = TextStyle(
      color: Colors.grey[600]!,
      fontWeight: FontWeight.w700,
    );

    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay, // 수정
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        //...
      ),
      calendarStyle: CalendarStyle(
       //...그대로 가져오기
      ),
      onDaySelected: onDaySelected, // 수정
      selectedDayPredicate: selectedDayPredicate, // 수정
    );
  }
}

```

```dart
// home_screen.dart

import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/Calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              focusedDay: DateTime(2024, 10, 1),
              onDaySelected: onDaySelected, // 수정
              selectedDayPredicate: selectedDayPredicate, // 수정
            ),
          ],
        ),
      ),
    );
  }
  // 클래스로 관리
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
    });
  }

  // 클래스로 관리
  bool selectedDayPredicate(DateTime date) {
    if (selectedDay == null) {
      return false;
    }
    return date.isAtSameMomentAs(selectedDay ?? DateTime.now());
  }
}
```

<br>
<br>

### TodayBanner 작업하기

- 하단 배너 추가 (선택한 날짜 표기, task 개수 표기)
- TodayBanner.dart 파일 생성하여 컴포넌트 분리

```dart
// today_banner.dart

import 'package:flutter/material.dart';
import 'package:calendar_scheduler/const/color.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int taskCount;

  const TodayBanner({
    super.key,
    required this.selectedDay,
    required this.taskCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '$taskCount개',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

```dart
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/Calendar.dart';
import 'package:calendar_scheduler/component/today_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc( // 추가
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              focusedDay: DateTime(2024, 10, 1),
              onDaySelected: onDaySelected,
              selectedDayPredicate: selectedDayPredicate,
            ),
            TodayBanner( // 추가
              selectedDay: selectedDay,
              taskCount: 0,
            ),
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
    });
  }

  bool selectedDayPredicate(DateTime date) { // 수정
    return date.isAtSameMomentAs(selectedDay);
  }
}
```

<img width="759" alt="스크린샷 2024-10-16 오후 10 32 46" src="https://github.com/user-attachments/assets/57b44991-0cef-4218-8672-e81eecd0dd2f">

<br>
<br>

### ScheduleCard 만들기

- ListView : 리스트 뷰 생성(스크롤 가능)
- IntrinsicHeight : 자식 위젯의 높이를 기준으로 높이 설정
- IntrinsHeight 없이 CrossAxisAlignment.stretch 사용하면 기준인 height가 없기 때문에 오류 발생

```dart
// home_screen.dart

import 'package:calendar_scheduler/component/schedule_card.dart';
//...

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              //...
            ),
            TodayBanner(
              //...
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ListView(
                  children: [
                    ScheduleCard(
                      startTime: DateTime(
                        2024,
                        10,
                        1,
                        11,
                        0,
                      ),
                      endTime: DateTime(
                        2024,
                        10,
                        1,
                        12,
                        0,
                      ),
                      content: '플러터 공부하기',
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//...
}
```

```dart
// schedule_card.dart

import 'package:calendar_scheduler/const/color.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final String content;
  final Color color;

  const ScheduleCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${startTime.hour.toString().padLeft(2, '0')}:00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '${endTime.hour.toString().padLeft(2, '0')}:00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Text(content),
              ),
              Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                width: 16.0,
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

<img width="759" alt="스크린샷 2024-10-17 오후 11 40 46" src="https://github.com/user-attachments/assets/8eeaef42-6cf9-4b72-ac6c-e5a6b73dc73a">

<br>
<br>

### BottomSheet 보여주기

- 우측 하단 아이콘 버튼(floatingActionButton) 클릭시 올라오는 시트 만들기

```dart
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc(
    //...
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton( // 추가
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => Container(
              color: Colors.white,
              height: 600,
              child: Column(
                children: [
                  // Text('스케줄 추가'),
                ],
              ),
            ),
          );
        },
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
        ),
      ),
//...
```

<img width="759" alt="스크린샷 2024-10-17 오후 11 52 18" src="https://github.com/user-attachments/assets/f7f2cd38-4f59-4187-81d5-f1628bad3337">

<img width="759" alt="스크린샷 2024-10-17 오후 11 52 50" src="https://github.com/user-attachments/assets/5659299a-d2fa-4401-8847-a6265e40834c">

<br>
<br>

### 시간 텍스트필드 작업하기

- lib/component/custorm_text_field.dart 추가
- TextFormField, InputDecoration 스타일
```dart
// custom_text_field.dart

import 'package:flutter/material.dart';
import 'package:calendar_scheduler/const/color.dart';

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextFormField( // 텍스트 필드
          decoration: InputDecoration( // 텍스트 필드 스타일
            border: InputBorder.none, // 테두리 없애기
            filled: true, // 배경색 채우기
            fillColor: Colors.grey[300], // 배경색
          ),
          cursorColor: Colors.grey, // 커서 색상
        ),
      ],
    );
  }
}
```

```dart
// home_screen.dart
//...
Row(
  children: [
    Expanded(
      child: CustomTextField(
        label: '시작 시간',
      ),
    ),
    SizedBox(width: 16.0),
    Expanded(
      child: CustomTextField(
        label: '마감 시간',
      ),
    ),
  ],
),
//...
```

(레이블 텍스트 부분 변수로 변경해줘야 함)

<img width="759" alt="스크린샷 2024-10-20 오후 7 29 53" src="https://github.com/user-attachments/assets/11e7bc6b-f6a3-4230-820b-153c3695b0fe">

<br>
<br>

### TextFormField의 Expand 프로퍼티 사용해보기

- TextFormField를 최대 크기로 확장하여 여러줄 입력으로 바꾸고 싶다면, Expanded 위젯을 사용하여 확장시키고, expands, maxLines, minLines 속성을 사용하여 최대 크기를 설정할 수 있다.

```dart
// custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/const/color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool expand; // 확장 가능 여부

  const CustomTextField({
    super.key,
    required this.label,
    this.expand = false, // 확장 가능 여부
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (!expand) renderTextFormField(), // expand가 false일 때
        if (expand) // expand가 true일 때 Expanded로 확장
          Expanded(
            child: renderTextFormField(),
          ),
      ],
    );
  }

  Widget renderTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
      minLines: expand ? null : 1, // 최소 줄 수
      maxLines: expand ? null : 1, // 최대 줄 수
      expands: expand, // 확장 가능 여부
      cursorColor: Colors.grey,
    );
  }
}
```

```dart
// home_screen.dart
//...
child: Column(
  children: [
    Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: CustomTextField(
            label: '마감 시간',
          ),
        ),
      ],
    ),
    Expanded(
      child: CustomTextField(
        label: '내용',
        expand: true, // 확장 가능 여부
      ),
    ),
  ],
),
//...
```

<img width="759" alt="스크린샷 2024-10-20 오후 8 28 01" src="https://github.com/user-attachments/assets/dc2cde8f-158e-43fc-972f-3641a4deb084">

<br>
<br>

### 카테고리 색상 렌더링하기 ~ BottomSheet 디자인 마무리하기

- 하단 텍스트 필드 SafeArea 위젯으로 감싸서 화면 밑으로 넘어가지 않게 수정.
```dart
// home_screen.dart
//...
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return Container(
                color: Colors.white,
                height: 400,
                child: SafeArea( // 추가
//...
```

<img width="759" alt="스크린샷 2024-10-20 오후 8 44 01" src="https://github.com/user-attachments/assets/dbd686e9-ade1-4ef5-9bbf-dc9f13bc0f34">

- 하단 텍스트 필드 컴포넌트 분리
- 카테고리 컬러 클릭시 색상 변경
- GestureDetector : 사용자의 제스처 입력을 감지하는 위젯
  - 자식 위젯을 감싸서 해당 위젯 영역에서 발생하는 제스처를 감지
  - 탭, 더블 탭, 길게 누르기, 드래그, 스와이프 등 여러 종류의 제스처를 감지

<br>

```dart
// schedule_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:calendar_scheduler/const/color.dart';
import 'package:calendar_scheduler/component/custorm_text_field.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  String selectedColor = categoryColors.first; // 첫번째 색상으로 카테고리 컬러 기본값 설정

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 600,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
          child: Column(
            children: [
              _Time(),
              _Content(),
              SizedBox(height: 8.0),
              _Category(
                selectedColor: selectedColor,
                onTap: (String color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
              SizedBox(height: 8.0),
              _SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: CustomTextField(
            label: '마감 시간',
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        label: '내용',
        expand: true,
      ),
    );
  }
}

typedef OnColorSelected = void Function(String color); // 카테고리 컬러 선택 시 색상 변경 함수 타입 정의

class _Category extends StatelessWidget {
  final String selectedColor;
  final OnColorSelected onTap;

  const _Category({
    super.key,
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categoryColors
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector( // 카테고리 컬러 선택 시 색상 변경
                onTap: () => onTap(e),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(
                      int.parse(
                        'FF$e',
                        radix: 16,
                      ),
                    ),
                    border: e == selectedColor
                        ? Border.all(
                            color: Colors.black,
                            width: 4.0,
                          )
                        : null,
                    shape: BoxShape.circle,
                  ),
                  width: 32.0,
                  height: 32.0,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
            child: Text('저장'),
          ),
        ),
      ],
    );
  }
}
```

<br>
<br>

### ScheduleModel 생성하기

- 일정 데이터를 저장하는 모델

```dart
// model/schedule.dart

class Schedule {
  // 1) 식별 가능한 ID
  final int id;
  // 2) 시작 시간
  final int startTime;
  // 3) 종료 시간
  final int endTime;
  // 4) 일정 내용
  final String content;
  // 5) 날짜
  final DateTime date;
  // 6) 카테고리
  final String color;
  // 7) 일정 생성 날짜 시간
  final DateTime createdAt;

  Schedule({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.date,
    required this.color,
    required this.createdAt,
  });
}
```

<br>
<br>

### ScheduleModel 사용해서 ScheduleCard 보여주기

- 저장된 일정 데이터를 map을 사용하여 출력

```dart
// home_screen.dart
//...

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

/*
  {
    2023-11-23:[schedule, schedule],
    2023-11-24:[schedule, schedule]
  }
*/
  Map<DateTime, List<Schedule>> schedules = {
    DateTime.utc(2024, 10, 1): [
      Schedule(
        id: 1,
        startTime: 11,
        endTime: 12,
        content: '플러터 공부하기',
        date: DateTime.utc(2024, 10, 1),
        color: categoryColors[0],
        createdAt: DateTime.now().toUtc(),
      ),
      Schedule(
        id: 1,
        startTime: 14,
        endTime: 16,
        content: 'NestJS 공부하기',
        date: DateTime.utc(2024, 10, 1),
        color: categoryColors[3],
        createdAt: DateTime.now().toUtc(),
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //...
      ),
      body: SafeArea(
        child: Column(
          children: [
           //...
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ListView(
                  children: schedules.containsKey(selectedDay) // 선택한 날짜에 스케줄이 있는지 확인
                      ? schedules[selectedDay]! // 있으면 스케줄 리스트 반환
                          .map(
                            (e) => ScheduleCard(
                              startTime: e.startTime,
                              endTime: e.endTime,
                              content: e.content,
                              color: Color(int.parse(
                                'FF${e.color}',
                                radix: 16,
                              )),
                            ),
                          )
                          .toList()
                      : [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
//...
```

<img width="759" alt="스크린샷 2024-10-20 오후 11 58 17" src="https://github.com/user-attachments/assets/15cf7e6a-03dd-4cb1-80c5-c1765fb09997">

<br>
<br>


🧀🍟🍕🍔🍗

### ListView itemBuilder()와 separated() 생성자 알아보기

- ListView.builder() 사용
  - 많은 양의 데이터를 효율적으로 표시하기 위해 사용되는 생성자, 레이지 로딩
  - 화면에 보이는 아이템만 렌더링

사용 예시
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]),
    );
  },
)
```

<br>

- ListView.separated() 사용
  - ListView.builder()의 확장된 형태로, 리스트 아이템 사이에 구분자(separator)를 추가할 수 있는 기능
  - 리스트 아이템 사이에 구분자를 쉽게 추가(SizedBox, Divider 등을 넣어 구분 가능)

사용 예시
```dart
ListView.separated(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]),
    );
  },
  separatorBuilder: (context, index) {
    return Divider();
  },
)
```

일정 리스트 사이에 SizedBox 구분자

<img width="759" alt="스크린샷 2024-10-21 오후 11 43 58" src="https://github.com/user-attachments/assets/c98747e4-0dda-47f2-a808-24a48e6ab22a">

<br>
<br>

### validate() 함수 TextFormField에 적용하기 ~ onSave() 함수 테스트하기

- onSaved 함수 사용하여 시작시간, 마감시간, 내용을 입력했을 때 값들을 반환받아 저장
- validator 검증 로직 
  - 시작시간이 마감시간보다 크거나 내용이 비어있을 때 경고 메세지 출력
- save를 실행하면 form 안에 있는 모든 TextFormField에 onSaved 함수가 실행된다.
- validate 함수를 실행하면  form 안에 있는 모든 TextFormField에 있는 validator 함수가 실행된다.
- validate 함수는 boolean 값을 반환하기 때문에 모든 TextFormField의 validator 함수가 실행되고 모두 true 값을 반환해야 저장이 된다. false면 오류가 있었다는 의미이다.

작업 파일
- lib/component/custorm_text_field.dart
- lib/component/schedule_bottom_sheet.dart

<br>

validate
<img width="759" alt="스크린샷 2024-10-22 오후 11 12 25" src="https://github.com/user-attachments/assets/af7f3ce8-e81a-46b9-aed6-e82877850d26">

<br>

onSaved

<img width="757" alt="스크린샷 2024-10-22 오후 11 22 04" src="https://github.com/user-attachments/assets/98c3d4d0-6437-4889-86eb-0b9a283bf5ea">

![스크린샷 2024-10-22 오후 11 21 53](https://github.com/user-attachments/assets/785e31fe-e1bc-4b72-bd3c-2fb8d3218a36)

<br>
<br>

### 위젯트리 상위로 validate() 함수 올리기 ~ validate() 함수 작업하기

작업 파일
- lib/component/schedule_bottom_sheet.dart

![스크린샷 2024-10-23 오전 12 10 04](https://github.com/user-attachments/assets/93fcb451-ec9c-405f-bf45-5a70f18b7f9c)

<img width="352" alt="스크린샷 2024-10-23 오전 12 09 51" src="https://github.com/user-attachments/assets/b3a33418-dbb2-4aea-b925-39a39d0bd320">

<img width="333" alt="스크린샷 2024-10-23 오전 12 17 41" src="https://github.com/user-attachments/assets/d81338c0-1fa8-417e-8b01-1bc675eee712">

<br>
<br>

### 일정 메모리에 생성하기 (여기서 부터 ~ 내용 추가 필요 🐹🧀 ----------------)

- 카테고리 컬러 선택시 상태관리가 되도록 변경

```dart
// lib/component/schedule_bottom_sheet.dart

//...
  void onSavePressed() {
    final isVaild = formKey.currentState!.validate();

    if (isVaild) {
      formKey.currentState!.save();

      final schedule = Schedule(
        id: 999,
        startTime: startTime!,
        endTime: endTime!,
        content: content!,
        color: selectedColor,
        date: widget.selectedDay,
        createdAt: DateTime.now().toUtc(),
      );

      Navigator.of(context).pop(schedule);
    }
  }
}
//...
```

- lib/screen/home_screen.dart

방법 1
```dart
//...
setState(() {
  schedules = {
    ...schedules,
    schedule.date: [
      if (schedules.containsKey(schedule.date))
        ...schedules[schedule.date]!,
      schedule,
    ]
  };
});
```

방법 2
```dart
//...
final dateExists = schedules.containsKey(schedule.date);

final List<Schedule> existingSchedules =
  dateExists ? schedules[schedule.date]! : [];

  existingSchedules.add(schedule);

setState(() {
  schedules = {
    ...schedules,
    schedule.date: existingSchedules,
  };
});
```

<br>
<br>

### SQL 기본기

- 매번 load시 일정이 사라지는 문제는 서버에 저장 또는 핸드폰 로컬에 저장하는 방법이 있음. 강의에서는 핸드폰에 저장하는 방법을 사용.
- RAM은 빠르지만 데이터의 휘발성이 높다.
- HDD/SSD는 느리지만 장기적으로 데이터를 유지 할 수 있다.
- SQL을 사용하여 하드드라이브에 장기적으로 저장
- SQL : Structured Query Language
  - Select(데이터 선택)
  - Update(데이터 업데이트)
  - Delete(데이터 삭제)
  - Insert(데이터 추가)
  - Join(데이터 결합)
  - Many to One Relationship(여러개의 데이터와 하나의 데이터를 연결)
  - Many to Many Relationship(여러개의 데이터와 여러개의 데이터를 연결)

<br>
<br>

### Drift 소개

- Drift, sqflite를 동시에 pubspec.yaml에 추가
  - pub.dev 사이트 - sqflite 2.3.2
  - https://drift.simonbinder.eu/setup/
  - 강의 기준으로 버전 사용

- dependencies는 배포시에도 필요, dev_dependencies는 개발시에만 필요

```yaml
# pubspec.yaml

dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.6
  table_calendar: ^3.1.0
  intl: ^0.19.0
  drift: ^2.16.0 # 추가
  sqlite3_flutter_libs: ^0.5.0 # 추가
  path_provider: ^2.0.0 # 추가  
  path: ^1.9.0 # 추가

dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^3.0.0
  drift_dev: ^2.16.0 # 추가
  build_runner: ^2.4.8 # 추가
```
<br>
<br>

### Drift Table 모델 만들기

- Drift에서 요구하는 형태로 코드 변경

```dart
import 'package:drift/drift.dart';

class Schedule extends Table {
  // 1) 식별 가능한 ID
  IntColumn get id => integer().autoIncrement()();

  // 2) 시작 시간
  IntColumn get startTime => integer()();

  // 3) 종료 시간
  IntColumn get endTime => integer()();

  // 4) 일정 내용
  TextColumn get content => text()();

  // 5) 날짜
  DateTimeColumn get date => dateTime()();

  // 6) 카테고리
  TextColumn get color => text()();

  // 7) 일정 생성 날짜 시간
  DateTimeColumn get createdAt => dateTime().clientDefault(
        () => DateTime.now().toUtc(),
      )();
}
```

<br>
<br>

### Code Generation 실행하기

- Drift를 사용하면 데이터베이스를 어떤 파일에다 저장해야 될지 데이터베이스를 초기화하겠다는 코드를 작성해줘야함. 프로젝트마다 Drift를 사용할거면 항상 거쳐야하는 작업.
- 하단과 같이 코드를 작성 후, 다른 파일에서 오류나는 부분 전부 주석처리 후 터미널 명령어 실행하여 dart.g.dart 파일 생성

```dart
// drift.dart
import 'dart:io';

import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'package:calendar_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

part 'drift.g.dart';

@DriftDatabase(
  tables: [ScheduleTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder =
        await getApplicationDocumentsDirectory(); // docuemnts 디렉토리 가져오기

    // C:\\Users\flutter
    // /Users/flutter
    // /Users/flutter + /name/codefactory
    // /Users/flutter/name/codefactory
    //
    // /Users/flutter/name/codefactory/db.sqlite
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions(); // 안드로이드 옛날 버전에서 생기는 문제를 해결해주는 코드
    }

    final cachebase = await getTemporaryDirectory(); // 임시 디렉토리 가져오기

    sqlite3.tempDirectory = cachebase
        .path; // sqlite가 자동으로 임시 폴더를 사용, 어떤 용도로 사용하는지는 알 수 없음. 아마도 캐시나 메타데이터? 실행을 하면서 생기는 임시 파일을 저장하는 용도일 것임.

    return NativeDatabase.createInBackground(file); // 백그라운드에서 데이터베이스 생성
  });
}
```

<br>

drift.g.dart 파일 생성
>$ dart run build_runner build

<br>
<br>

### SQL 메서드 선언하기

- 일정 리스트 가져오기, 일정 추가 코드 작성해보기

```dart
// lib/drift/drift.dart
//...
@DriftDatabase(
  tables: [ScheduleTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<List<ScheduleTableData>> getSchedules() => select(scheduleTable).get(); // 일정 리스트 조회

  Future<int> createSchedule(ScheduleTableCompanion data) =>
      into(scheduleTable).insert(data); // 일정 추가

  @override
  int get schemaVersion => 1;
}
//...
```

<br>
<br>

### Insert & Select 테스트하기

- 하단 코드를 실행시키기 전에 데이터베이스 초기화 코드를 작성해서 실행시켜야 함.

```dart
// lib/screen/home_screen.dart
  Future<List<ScheduleTableData>> getSchedules() => select(scheduleTable).get(); // 일정 리스트 조회

  Future<int> createSchedule(ScheduleTableCompanion data) =>
      into(scheduleTable).insert(data); // 일정 추가
```

- 초기화 코드 작성

```dart
// lib/main.dart

import 'package:calendar_scheduler/const/color.dart';
import 'package:calendar_scheduler/database/drift.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  final database = AppDatabase();

  await database.createSchedule(ScheduleTableCompanion(
    startTime: Value(12), // Value로 감싸주기
    endTime: Value(13),
    content: Value('Flutter 프로그래밍'),
    date: Value(DateTime.utc(2024, 10, 27)),
    color: Value(categoryColors.first),
  ));

  final resp = await database.getSchedules();
  print('--------------------------------');
  print(resp);

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
```

작성 후 메인 함수를 재실행 시켜주기 위해 앱 다시 실행

![스크린샷 2024-10-27 오전 1 33 21](https://github.com/user-attachments/assets/9ba232b8-84aa-4f93-893e-930a07bca1a2)

<br>
<br>

### 일정 생성하기

- 의존성 주입, 저장해놓은 값 가져오기
- 다른 곳에서 사용할 수 있는 특정 변수나 특정 값들을 한 곳에다 선언을 해두고 그 값을 어디에서든 사용할 수 있도록 주입을 해주는 방식
  - pub.dev 사이트에서 get_it 7.6.7 사용
  - https://pub.dev/packages/get_it

```yaml
# pubspec.yaml

dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.6
  table_calendar: ^3.1.0
  intl: ^0.19.0
  drift: ^2.16.0
  sqlite3_flutter_libs: ^0.5.0
  path_provider: ^2.0.0
  path: ^1.9.0
  get_it: ^7.6.7 # 추가
```

- 메인 함수 수정

```dart
// lib/main.dart

//...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  final database = AppDatabase();

  GetIt.I.registerSingleton<AppDatabase>(database); // 수정 - 의존성 주입

  final resp = await database.getSchedules(); // 수정 - 저장해놓은 값 가져오기
  print(resp); // 수정 - 입력한 값 출력해보기

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

```

- 일정 추가 코드 수정
- GetIt을 사용하여 필요한 값 제공받아 가져오기
- Column 코드 오류가 나는데, package:drift/drift.dart 패키지에서 Column을 가져오는 코드를 숨겨주기 위해 수정
- 이 상태에서 + 버튼 누르고 일정 추가하면 디버그 콘솔에 입력한 값 출력됨.

```dart
// lib/component/schedule_bottom_sheet.dart
import 'package:drift/drift.dart' hide Column;

//...
  void onSavePressed() async {
    final isVaild = formKey.currentState!.validate();

    if (isVaild) {
      formKey.currentState!.save();

      final database = GetIt.I<AppDatabase>();

      await database.createSchedule(ScheduleTableCompanion(
        startTime: Value(startTime!),
        endTime: Value(endTime!),
        content: Value(content!),
        date: Value(widget.selectedDay),
        color: Value(selectedColor),
      ));

      Navigator.of(context).pop();
    }
  }
//...
```

<img width="345" alt="스크린샷 2024-10-27 오전 1 53 09" src="https://github.com/user-attachments/assets/dd9a275e-5ef0-4c6b-b57f-2ba53f6c80db">

![스크린샷 2024-10-27 오전 1 54 41](https://github.com/user-attachments/assets/8fa22298-ed55-4f9e-928e-f23799ef7e24)

<br>
<br>

### 일정 불러오기

- FutureBuilder를 사용하여 비동기 작업 처리
- 데이터가 변경될때마다 다시 빌드, 일정 등록하자마자 빌드되도록 수정

```dart
// lib/screen/home_screen.dart
//...
class _HomeScreenState extends State<HomeScreen> {
//...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final schedule = await showModalBottomSheet<ScheduleTable>(
            context: context,
            builder: (_) {
              return ScheduleBottomSheet(
                selectedDay: selectedDay,
              );
            },
          );

          setState(() {}); // 수정 - 등록 이후 바로 빌드 다시 하기

         //...

      body: SafeArea(
        //...
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: FutureBuilder<List<ScheduleTableData>>( // 여기서부터 수정 - FutureBuilder 사용
                    future: GetIt.I<AppDatabase>()
                        .getSchedules(), // Future가 변경될때마다 다시 빌드
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        // 에러가 있을때
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }

                      if (!snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.waiting) {
                        // 데이터가 없는 상태, 연결 상태 (함수를 처음 실행한 상태)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final schedules = snapshot.data!;

                      final selectedSchedules = schedules
                          .where(
                            (e) => e.date.isAtSameMomentAs(selectedDay),
                          )
                          .toList();

                      return ListView.separated(
                        itemCount: selectedSchedules.length,
                        itemBuilder: (BuildContext context, int index) {

                          final schedule = selectedSchedules[index];

                          return ScheduleCard(
                            startTime: schedule.startTime,
                            endTime: schedule.endTime,
                            content: schedule.content,
                            color: Color(
                              int.parse(
                                'FF${schedule.color}',
                                radix: 16,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 8.0);
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
//..
```

<br>
<br>

### where() 쿼리 사용해서 데이터베이스에서 일정 필터링하기

- 지금까지 작성한 코드는 모든 일정을 불러오는 코드였는데, 필요한 값(특정 날짜에 해당되는 일정)들만 불러오도록 수정(모든 데이터를 불러오도록 하게 하면 안됨)

- drift.dart 파일에서 where() 코드 추가 및 수정해주고, home_screen.dart 파일에서 필터링해주던 코드 삭제 및 매개변수로 날짜 전달해주기

```dart
// lib/database/drift.dart

//...
@DriftDatabase(
  tables: [ScheduleTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<List<ScheduleTableData>> getSchedules(
    DateTime date,
  ) =>
      (select(scheduleTable)..where((table) => table.date.equals(date))).get();

  Future<int> createSchedule(ScheduleTableCompanion data) =>
      into(scheduleTable).insert(data);

  @override
  int get schemaVersion => 1;
}
//...
```

<br>
<br>

### Dismissible 위젯 사용해보기

- 일정 리스트 왼쪽으로 스와이프시 삭제 구현하기

```dart
// lib/screen/home_screen.dart
//...
return Dismissible(
  key: ObjectKey(schedule.id),
  direction: DismissDirection.endToStart, // 스와이프 방향
  onDismissed: (direction) {
    // 스와이프 되었을때 실행되는 함수
    print(direction);
  },
  child: ScheduleCard(
    startTime: schedule.startTime,
    endTime: schedule.endTime,
//...
```
<br>
<br>

### Dismiss 되면 일정 삭제하기

- onDismissed 사용해서 UI에서는 사라지지만 데이터베이스에서는 삭제가 되지 않는 문제로 오류 발생.
- 바로 다음에 setState() 함수를 사용해서 빌드를 다시 해줘도 같은 문제 발생.
- async로 삭제처리를 해야할 경우 confirmDismiss 사용 ⭐️✨
  - return true를 주기 전에 데이터 삭제처리 후 setState() 함수 사용해서 빌드 다시 하기

```dart
// lib/database/drift.dart
//...
Future<int> removeSchedule(int id) =>
    (delete(scheduleTable)..where((table) => table.id.equals(id))).go();
```

```dart
// lib/screen/home_screen.dart
//...
return Dismissible(
  key: ObjectKey(schedule.id),
  direction: DismissDirection.endToStart, // 스와이프 방향
  confirmDismiss: (DismissDirection direction) async {
    await GetIt.I<AppDatabase>().removeSchedule(
      schedule.id,
    );
    setState(() {});
    return true;
  },
//...
```

<br>
<br>

### FutureBuilder 대신 StreamBuilder 사용하기

- StreamBuilder 사용해서 setState() 함수 사용하지 않고 자동으로 빌드 실행(setState() 함수 삭제하기)
- FutureBuilder에서 Dismissible 업데이트 안됐던 문제도 자동으로 해결됨
- 데이터 불러올때 잠깐 오류 화면 보여주는 문제 해결

```dart
// lib/database/drift.dart
//...
Stream<List<ScheduleTableData>> streamSchedules(DateTime date) =>
    (select(scheduleTable)..where((table) => table.date.equals(date)))
        .watch();
```

```dart
// lib/screen/home_screen.dart
//...
Expanded(
  child: Padding(
    padding:
        const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
    child: StreamBuilder<List<ScheduleTableData>>(
        stream: GetIt.I<AppDatabase>()
            .streamSchedules(selectedDay), // Future가 변경될때마다 다시 빌드
        builder: (context, snapshot) {
        //...

          if (snapshot.data == null) {
            // 데이터가 없는 상태, 연결 상태 (함수를 처음 실행한 상태)
            return Center(
              child: CircularProgressIndicator(),
            );
          }
//...
```

<br>
<br>

### 정렬하기

- 일정 정렬하기(orderBy() 사용)

```dart
// lib/database/drift.dart
//...
Stream<List<ScheduleTableData>> streamSchedules(DateTime date) =>
    (select(scheduleTable)
          ..where(
            (table) => table.date.equals(date),
          )
          ..orderBy([
            (table) => OrderingTerm(
                  expression: table.startTime,
                  mode: OrderingMode.asc, // 오름차순, desc 내림차순
                ),
            (table) => OrderingTerm( // 중복 정렬일때는 endTime 기준으로 정렬
              expression: table.endTime,
              mode: OrderingMode.asc, // 오름차순, desc 내림차순
            ),
          ]))
        .watch();
//...
```

<br>
<br>

### update() 함수 작업하기

- 일정 수정하기(update() 사용)

```dart
// lib/database/drift.dart

// id 기준으로 데이터 수정(업데이트)
Future<int> updateScheduleById(int id, ScheduleTableCompanion data) =>
    (update(scheduleTable)..where((tbl) => tbl.id.equals(id))).write(data);
    //...
```

<br>
<br>

### 기존 일정 업데이트하는 기능 만들기

- 일정 선택시 id를 받아와서 바텀시트 띄우고, 원래 가진 값 보여주고 수정 후 저장하면 수정된 값 반영되도록
- id가 null이라면 새로운 일정 추가하는 것으로 처리

수정 파일
- lib/database/drift.dart
- lib/screen/schedule_bottom_sheet.dart
- lib/screen/home_screen.dart
- lib/screen/custom_text_field.dart

```dart
// lib/database/drift.dart

// 하나의 데이터를 가져올 때 getSingle
Future<ScheduleTableD~ata> getScheduleById(int id) =>
    (select(scheduleTable)..where((table) => table.id.equals(id)))
        .getSingle();~
```

```dart
// lib/screen/schedule_bottom_sheet.dart
//...
@override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.id == null
            ? null
            : GetIt.I<AppDatabase>().getScheduleById(widget.id!),
        builder: (context, snapshot) {
          if (widget.id != null &&
              snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = snapshot.data;
//...
```

```dart
// lib/screen/home_screen.dart
//...

child: GestureDetector(
  onTap: () async {
    await showModalBottomSheet<ScheduleTable>(
      context: context,
      builder: (_) {
        return ScheduleBottomSheet(
          selectedDay: selectedDay,
          id: schedule.id,
        );
      },
    );
  },
  child: ScheduleCard(
```

<br>
<br>

### 저장하기 버튼에 기존 일정 수정기능 추가하기

- 수정하고 저장시 데이터 반영되도록 코드 작성

```dart
// lib/screen/schedule_bottom_sheet.dart
//...
void onSavePressed() async {
    final isVaild = formKey.currentState!.validate();

    if (isVaild) {
      formKey.currentState!.save();

      final database = GetIt.I<AppDatabase>();

      if (widget.id == null) {
        await database.createSchedule(ScheduleTableCompanion(
          startTime: Value(startTime!),
          endTime: Value(endTime!),
          content: Value(content!),
          date: Value(widget.selectedDay),
          color: Value(selectedColor),
        ));
      } else {
        await database.updateScheduleById(
            widget.id!,
            ScheduleTableCompanion(
              startTime: Value(startTime!),
              endTime: Value(endTime!),
              content: Value(content!),
              date: Value(widget.selectedDay),
              color: Value(selectedColor),
            ));
      }

      Navigator.of(context).pop();
    }
  }
}
```

<br>
<br>

### CategoryTable 생성하기

- Join -> 카테고리 테이블을 따로 만들어서 연결하여 관리하기

```dart
// lib/model/schedule.dart
//...
  // 6) 카테고리
  IntColumn get categoryId => integer().references(
        CategoryTable,
        #id, // 카테고리 테이블의 id랑 연결
      )();
//...
```

```dart
// lib/model/category.dart 파일 생성

import 'package:drift/drift.dart';

class CategoryTable extends Table {
  // 1) 식별 가능한 ID
  IntColumn get id => integer().autoIncrement()();

  TextColumn get color => text()(); // 색상 정보 저장

  // 7) 일정 생성 날짜 시간
  DateTimeColumn get createdAt => dateTime().clientDefault(
        () => DateTime.now().toUtc(),
      )();
}
```

```dart
// lib/database/drift.dart

//...
@DriftDatabase(
  tables: [ScheduleTable, CategoryTable],
)
//...
```

연결 후 명령어 실행
- 이후 하단 파일에서 에러나는 부분 수정은 다음 챕터에서 진행
- lib/component/schedule_bottom_sheet.dart
- lib/screen/home_screen.dart
- 에러나는 이유 : 카테고리 테이블이 생겼고, color라고 되어있던 부분이 colorId로 변경됨

>$ dart run build_runner build