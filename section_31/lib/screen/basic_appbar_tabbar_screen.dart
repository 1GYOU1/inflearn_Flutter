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
