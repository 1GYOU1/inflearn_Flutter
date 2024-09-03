# [이론] TabBar Widgets

### 인트로
- 프로젝트 세팅

```dart
// lib/main.dart

import 'package:flutter/material.dart';
import 'package:tabbar_theory/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
```

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';
import 'package:tabbar_theory/screen/basic_appbar_tabbar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () { //  버튼 클릭 시 탭바 스크린 화면으로 이동
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BasicAppBarTabBarScreen(),
                  ),
                );
              },
              child: Text('Basic AppBar TabBar Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
```

- 5개의 탭을 구현하기 위한 데이터 파일

```dart
// lib/const/tabs.dart

import 'package:flutter/material.dart';

class TabInfo {
  final IconData icon;
  final String label;

  const TabInfo({required this.icon, required this.label});
}

const TABS = [
  TabInfo(
    icon: Icons.account_balance_outlined,
    label: '지갑',
  ),
  TabInfo(
    icon: Icons.alarm_add_outlined,
    label: '알람',
  ),
  TabInfo(
    icon: Icons.keyboard,
    label: '키보드',
  ),
  TabInfo(
    icon: Icons.ac_unit,
    label: '온도',
  ),
  TabInfo(
    icon: Icons.adb,
    label: '안드로이드',
  ),
];
```

```dart
// lib/screen/basic_appbar_tabbar_screen.dart

import 'package:flutter/material.dart';

class BasicAppBarTabBarScreen extends StatelessWidget {
  const BasicAppBarTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
```

<img width="756" alt="스크린샷 2024-09-03 오후 10 56 17" src="https://github.com/user-attachments/assets/e584f338-8a7e-4ed2-ba1d-02a1d6d36f44">

<br>

### TabBar 기본

- 앱바 안에다가 탭바을 넣어보는 작업

```dart
// lib/screen/basic_appbar_tabbar_screen.dart

import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class BasicAppBarTabBarScreen extends StatelessWidget {
  const BasicAppBarTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BasicAppBarScreen'),
          bottom: TabBar(
            tabs: TABS
              .map( // tabs 파일에 있는 데이터 사용
                (e) => Tab(
                  icon: Icon(e.icon),
                  child: Text(e.label),
                ),
              )
              .toList(),
          ),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}

```

<img width="756" alt="스크린샷 2024-09-03 오후 11 18 46" src="https://github.com/user-attachments/assets/62ed0cd1-b622-4bae-b2a4-ad3586bba62a">

<br>

### TabBar 스타일링하기

```dart
import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class BasicAppBarTabBarScreen extends StatelessWidget {
  const BasicAppBarTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BasicAppBarScreen'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100), // 탭바 높이 설정
            child: Row(
              // PreferredSize가 Widget을 반환하기 때문에 Row를 설정할 수 있음
              mainAxisAlignment: MainAxisAlignment.end, // 정렬
              children: [
                TabBar(
                  indicatorColor: Colors.red,
                  indicatorWeight: 4.0,
                  indicatorSize: TabBarIndicatorSize
                      .tab, // 탭 크기만큼, TabBarIndicatorSize.label - 탭 라벨 크기만큼
                  isScrollable:
                      true, // 탭바 아이콘이 많을 경우 스크롤 가능하게 설정, 탭의 크기만큼의 사이즈만 가져가고 중앙 정렬됨
                  labelColor: Colors.green, // 선택된 탭 라벨 색상
                  unselectedLabelColor: Colors.grey, // 선택되지 않은 탭 라벨 색상
                  labelStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ), // 선택된 탭 라벨 스타일
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w100,
                  ), // 선택되지 않은 탭 라벨 스타일
                  tabs: TABS
                      .map(
                        (e) => Tab(
                          icon: Icon(e.icon),
                          child: Text(e.label),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          // 탭바 하단 화면 영역 가운데에 아이콘 출력
          physics: NeverScrollableScrollPhysics(), // 터치 스크롤 불가능하게 설정
          children: TABS
              .map(
                (e) => Center(
                  child: Icon(e.icon),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
```

### Tab Controller 사용하기

- DefaultTabController를 사용하면 controller가 자동으로 주입이 되는데, 이런 방식보다 컨트롤러를 커스텀하는 방식을 많이 사용하기 때문에 컨트롤러 커스텀 하는 방법 알아보기.

```dart
// lib/screen/home_screen.dart

import 'package:flutter/material.dart';
import 'package:tabbar_theory/screen/basic_appbar_tabbar_screen.dart';
import 'package:tabbar_theory/screen/appbar_using_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BasicAppBarTabBarScreen(),
                  ),
                );
              },
              child: Text('Basic AppBar TabBar Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AppBarUsingController(),
                  ),
                );
              },
              child: Text('Appbar Using Controller'),
            ),
          ],
        ),
      ),
    );
  }
}
```

```dart
// lib/screen/appbar_using_controller.dart

import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class AppBarUsingController extends StatefulWidget {
  const AppBarUsingController({super.key});

  @override
  State<AppBarUsingController> createState() => _AppBarUsingControllerState();
}

class _AppBarUsingControllerState extends State<AppBarUsingController>
    with TickerProviderStateMixin {
  // 실제 한 프레임당 Tick이 움직이는 것을 효율적으로 처리하기 위해 사용
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: TABS.length, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar Using'),
        bottom: TabBar(
          controller: tabController,
          tabs: TABS
              .map(
                (e) => Tab(
                  icon: Icon(e.icon),
                  child: Text(e.label),
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: TABS
            .map(
              (e) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    e.icon,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (tabController.index != 0)
                        ElevatedButton(
                          onPressed: () {
                            tabController.animateTo(tabController.index - 1);
                          },
                          child: Text('이전'),
                        ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      if (tabController.index != TABS.length - 1)
                        ElevatedButton(
                          onPressed: () {
                            tabController.animateTo(tabController.index + 1);
                          },
                          child: Text('다음'),
                        ),
                    ],
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
```

<img width="756" alt="스크린샷 2024-09-04 오전 12 14 01" src="https://github.com/user-attachments/assets/e8411182-b8d7-48e5-ab08-29c6d55e76c5">

<br>