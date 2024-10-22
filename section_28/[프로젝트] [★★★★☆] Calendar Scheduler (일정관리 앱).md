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

