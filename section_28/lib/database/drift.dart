import 'dart:io';

import 'package:calendar_scheduler/model/category.dart';
import 'package:calendar_scheduler/model/schedule_with_category.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'package:calendar_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

part 'drift.g.dart';

@DriftDatabase(
  tables: [ScheduleTable, CategoryTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<int> createCategory(CategoryTableCompanion data) =>
      into(categoryTable).insert(data);

  Future<List<CategoryTableData>> getCategories() =>
      select(categoryTable).get();

  // 하나의 데이터를 가져올 때 getSingle
  Future<ScheduleWithCategory> getScheduleById(int id) {
    final query = select(scheduleTable).join([
      innerJoin(
        categoryTable,
        categoryTable.id.equalsExp(
          scheduleTable.colorId,
        ),
      )
    ])
      ..where(scheduleTable.id.equals(id)); // 스케쥴 테이블의 id가 id와 같은 것만 가져오도록 필터링

    return query.map((row) {
      final schedule = row.readTable(scheduleTable);
      final category = row.readTable(categoryTable);

      return ScheduleWithCategory(schedule: schedule, category: category);
    }).getSingle();
  }

  // id 기준으로 데이터 수정
  Future<int> updateScheduleById(int id, ScheduleTableCompanion data) =>
      (update(scheduleTable)..where((tbl) => tbl.id.equals(id))).write(data);

  Future<List<ScheduleTableData>> getSchedules(
    DateTime date,
  ) =>
      (select(scheduleTable)..where((table) => table.date.equals(date))).get();

  Stream<List<ScheduleWithCategory>> streamSchedules(DateTime date) {
    final query = select(scheduleTable).join([
      innerJoin(
        categoryTable,
        categoryTable.id.equalsExp(
          scheduleTable.colorId,
        ),
      )
    ])
      ..where(scheduleTable.date
          .equals(date)); // 스케쥴 테이블의 날짜가 DateTime date 날짜와 같은 것만 가져오도록 필터링

    return query.map((row) {
      final schedule = row.readTable(scheduleTable);
      final category = row.readTable(categoryTable);

      return ScheduleWithCategory(category: category, schedule: schedule);
    }).watch();
    /*
      scheduleTable을 select하고, categoryTable과 innerJoin을 해준다.
      list로 작성하는 이유는 여러 개 테이블을 동시에 Join할 수도 있기 때문
      Join을 할때는 equalsExp를 사용해야 한다.
      where이나 다른 쿼리할 때는 equals를 사용해야 한다.
      
      정리 : innerJoin으로 scheduleTable과 categoryTable을 연결시키고
            categoryTable의 id와 scheduleTable의 colorId가 같은 것끼리 row를 전부 연결하여 
            그 결과를 가지고 각각의 row를 다시 map(맵핑)을 해주는데,
            스케쥴만 가져오는 방법은 스케쥴 테이블에 해당되는 데이터만 row.readTable(scheduleTable) 작성
            카테고리만 가져오는 방법은 row.readTable(categoryTable)로 작성
            ScheduleWithCategory에 넣어줘서 watch를 통해 Stream을 반환할 수 있다.
    */

    // (select(scheduleTable)
    //       ..where(
    //         (table) => table.date.equals(date),
    //       )
    //       ..orderBy([
    //         (table) => OrderingTerm(
    //               expression: table.startTime,
    //               mode: OrderingMode.asc, // 오름차순, desc 내림차순
    //             ),
    //         (table) => OrderingTerm(
    //               expression: table.endTime,
    //               mode: OrderingMode.asc, // 오름차순, desc 내림차순
    //             ),
    //       ]))
    //     .watch();
  }

  Future<int> createSchedule(ScheduleTableCompanion data) =>
      into(scheduleTable).insert(data);

  Future<int> removeSchedule(int id) =>
      (delete(scheduleTable)..where((table) => table.id.equals(id))).go();

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.addColumn(categoryTable, categoryTable.randomNumber);
        }

        if (from < 3) {
          await m.addColumn(categoryTable, categoryTable.randomNumber2);
        }
      },
    );
  }
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
