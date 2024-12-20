// import 'package:calendar_scheduler/const/color.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/database/drift.dart';
import 'package:calendar_scheduler/model/schedule.dart';
import 'package:calendar_scheduler/model/schedule_with_category.dart';
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/calendar.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/color.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:get_it/get_it.dart';

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
  // Map<DateTime, List<ScheduleTable>> schedules = {
  //   DateTime.utc(2024, 10, 1): [
  //     ScheduleTable(
  //       id: 1,
  //       startTime: 11,
  //       endTime: 12,
  //       content: '플러터 공부하기',
  //       date: DateTime.utc(2024, 10, 1),
  //       color: categoryColors[0],
  //       createdAt: DateTime.now().toUtc(),
  //     ),
  //     ScheduleTable(
  //       id: 1,
  //       startTime: 14,
  //       endTime: 16,
  //       content: 'NestJS 공부하기',
  //       date: DateTime.utc(2024, 10, 1),
  //       color: categoryColors[3],
  //       createdAt: DateTime.now().toUtc(),
  //     ),
  //   ],
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet<ScheduleTable>(
            context: context,
            builder: (_) {
              return ScheduleBottomSheet(
                selectedDay: selectedDay,
              );
            },
          );
        },
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              focusedDay: DateTime(2024, 10, 1),
              onDaySelected: onDaySelected,
              selectedDayPredicate: selectedDayPredicate,
            ),
            StreamBuilder(
                stream: GetIt.I<AppDatabase>().streamSchedules(selectedDay),
                builder: (context, snapshot) {
                  return TodayBanner(
                    selectedDay: selectedDay,
                    taskCount: !snapshot.hasData ? 0 : snapshot.data!.length,
                  );
                }),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: StreamBuilder<List<ScheduleWithCategory>>(
                    stream: GetIt.I<AppDatabase>()
                        .streamSchedules(selectedDay), // Future가 변경될때마다 다시 빌드
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        // 에러가 있을때
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }

                      if (snapshot.data == null) {
                        // 데이터가 없는 상태, 연결 상태 (함수를 처음 실행한 상태)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final schedules = snapshot.data!;

                      return ListView.separated(
                        itemCount: schedules.length,
                        itemBuilder: (BuildContext context, int index) {
                          // 선택된 날짜에 해당하는 일정 리스트로 저장
                          // List<Schedule>
                          // final selectedSchedules = schedules[selectedDay]!;
                          // final scduleModel = selectedSchedules[index];

                          final scheduleWithCategory = schedules[index];
                          final schedule = scheduleWithCategory.schedule;
                          final category = scheduleWithCategory.category;

                          return Dismissible(
                            key: ObjectKey(schedule.id),
                            direction: DismissDirection.endToStart, // 스와이프 방향
                            // confirmDismiss: (DismissDirection direction) async {
                            //   await GetIt.I<AppDatabase>().removeSchedule(
                            //     schedule.id,
                            //   );
                            //   return true;
                            // },
                            onDismissed: (DismissDirection direction) {
                              GetIt.I<AppDatabase>().removeSchedule(
                                schedule.id,
                              );
                            },
                            child: GestureDetector(
                              onTap: () async {
                                await showModalBottomSheet<ScheduleTable>(
                                  context: context,
                                  builder: (_) {
                                    return ScheduleBottomSheet(
                                      selectedDay: selectedDay,
                                      id: schedule.id,
                                    );
                                  },
                                );
                              },
                              child: ScheduleCard(
                                startTime: schedule.startTime,
                                endTime: schedule.endTime,
                                content: schedule.content,
                                color: Color(
                                  int.parse(
                                    'FF${category.color}',
                                    radix: 16,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 8.0);
                        },
                      );
                    }),
              ),
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

  bool selectedDayPredicate(DateTime date) {
    return date.isAtSameMomentAs(selectedDay);
  }
}
