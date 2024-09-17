import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>
    with TickerProviderStateMixin {
  late final TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: TABS.length, vsync: this);
    controller.addListener(() {
      // 컨트롤러의 상태가 변경될 때마다 상태를 업데이트(인덱스 변경 업데이트)
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar'),
      ),
      body: TabBarView(
        controller: controller,
        children: TABS.map((e) => Center(child: Icon(e.icon))).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black, // 선택된 아이템 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
        showSelectedLabels: true, // 선택된 아이템 라벨 표시
        showUnselectedLabels: true, // 선택되지 않은 아이템 라벨 표시
        currentIndex: controller.index, // 현재 선택된 아이템 인덱스 - 탭바랑 연동
        type: BottomNavigationBarType
            .shifting, // 바텀 네비게이션 바 타입 : shifting(확장) / fixed(고정)
        onTap: (index) {
          // 누를때 마다 탭바 인덱스 변경
          controller.animateTo(index);
        },
        items: TABS
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
            .toList(),
      ),
    );
  }
}
