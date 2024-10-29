import 'package:drift/drift.dart';

class CategoryTable extends Table {
  // 1) 식별 가능한 ID
  IntColumn get id => integer().autoIncrement()();

  TextColumn get color => text()(); // 색상 정보 저장

  IntColumn get randomNumber => integer().nullable()();

  IntColumn get randomNumber2 => integer().withDefault(const Constant(0))();

  // 7) 일정 생성 날짜 시간
  DateTimeColumn get createdAt => dateTime().clientDefault(
        () => DateTime.now().toUtc(),
      )();
}
