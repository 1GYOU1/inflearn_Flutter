import 'package:flutter/material.dart';
import 'package:scrollable_widgets/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: false, // flutter 3.0 이전 버전에서 사용하던 디자인 시스템
      ),
      home: HomeScreen(),
    ),
  );
}
