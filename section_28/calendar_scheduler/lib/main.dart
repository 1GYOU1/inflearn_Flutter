// import 'package:calendar_scheduler/const/color.dart';
import 'package:calendar_scheduler/const/color.dart';
import 'package:calendar_scheduler/database/drift.dart';
import 'package:drift/drift.dart';
// import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  final database = AppDatabase();

  GetIt.I.registerSingleton<AppDatabase>(database);

  // 카테고리 테이블 정보 받아오기
  final colors = await database.getCategories();

  // 카테고리 테이블 정보가 없으면 색상들을 생성
  if (colors.isEmpty) {
    for (String hexCode in categoryColors) {
      await database.createCategory(
        CategoryTableCompanion(
          color: Value(hexCode),
        ),
      );
    }
  }

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
