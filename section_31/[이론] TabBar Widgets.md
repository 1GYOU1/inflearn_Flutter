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

