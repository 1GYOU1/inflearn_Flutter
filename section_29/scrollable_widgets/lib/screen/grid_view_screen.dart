import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "GridViewScreen",
      body: renderMaxExtent(),
    );
  }

  // 1. count - 한번에 다 그려냄
  Widget renderCount() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      children: numbers
          .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ))
          .toList(),
    );
  }

  // 2. builder - 보이는 것만 그려냄
  Widget renderBuilderCrossAxisCount() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) => renderContainer(
        color: rainbowColors[index % rainbowColors.length],
        index: index,
      ),
    );
  }

  // 3. 최대 사이즈 지정
  Widget renderMaxExtent() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100.0,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) => renderContainer(
        color: rainbowColors[index % rainbowColors.length],
        index: index,
      ),
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
}
