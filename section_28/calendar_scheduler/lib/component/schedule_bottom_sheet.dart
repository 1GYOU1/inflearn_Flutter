import 'package:calendar_scheduler/database/drift.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/const/color.dart';
import 'package:calendar_scheduler/component/custorm_text_field.dart';
import 'package:calendar_scheduler/model/schedule.dart';
import 'package:get_it/get_it.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final int? id;
  final DateTime selectedDay;

  const ScheduleBottomSheet({
    super.key,
    required this.selectedDay,
    this.id,
  });

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int? startTime;
  int? endTime;
  String? content;

  int? selectedColorId;

  @override
  void initState() {
    super.initState();
    initCategory();
  }

  initCategory() async {
    if (widget.id != null) {
      final resp = await GetIt.I<AppDatabase>().getScheduleById(widget.id!);

      setState(() {
        selectedColorId = resp.category.id;
      });
    } else {
      final resp = await GetIt.I<AppDatabase>().getCategories();
      setState(() {
        selectedColorId = resp.first.id;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selectedColorId == null) {
      return Container();
    }
    return FutureBuilder(
        future: widget.id == null
            ? null
            : GetIt.I<AppDatabase>().getScheduleById(widget.id!),
        builder: (context, snapshot) {
          if (widget.id != null &&
              snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = snapshot.data?.schedule;

          return Container(
            color: Colors.white,
            height: 600,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      _Time(
                        onStartSaved: onStartTimeSaved,
                        onEndSaved: onEndTimeSaved,
                        onStartValidate: onStartTimeValidate,
                        onEndValidate: onEndTimeValidate,
                        startTimeInitValue: data?.startTime.toString(),
                        endTimeInitValue: data?.endTime.toString(),
                      ),
                      _Content(
                        onSaved: onContentSaved,
                        onValidate: onContentValidate,
                        initialValue: data?.content,
                      ),
                      SizedBox(height: 8.0),
                      _Categories(
                        selectedColor: selectedColorId!,
                        onTap: (int color) {
                          setState(() {
                            selectedColorId = color;
                          });
                        },
                      ),
                      SizedBox(height: 8.0),
                      _SaveButton(onPressed: onSavePressed),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void onStartTimeSaved(String? value) {
    if (value == null) {
      return;
    }
    startTime = int.parse(value);
  }

  String? onStartTimeValidate(String? value) {
    if (value == null) {
      return '값을 입력 해주세요!';
    }
    if (int.tryParse(value) == null) {
      return '숫자를 입력 해주세요!';
    }

    final time = int.parse(value);
    if (time < 0 || time > 24) {
      return '0 ~ 24 사이의 값을 입력 해주세요!';
    }
    return null;
  }

  void onEndTimeSaved(String? value) {
    if (value == null) {
      return;
    }

    endTime = int.parse(value); // int 형식으로 변환
  }

  String? onEndTimeValidate(String? value) {
    if (value == null) {
      return '값을 입력 해주세요!';
    }
    if (int.tryParse(value) == null) {
      return '숫자를 입력 해주세요!';
    }
    final time = int.parse(value);
    if (time < 0 || time > 24) {
      return '0 ~ 24 사이의 값을 입력 해주세요!';
    }
    return null;
  }

  void onContentSaved(String? value) {
    if (value == null) {
      return;
    }
    content = value;
  }

  String? onContentValidate(String? value) {
    if (value == null) {
      return '내용을 입력 해주세요!';
    }
    if (value.length < 5) {
      return '5자 이상 입력 해주세요!';
    }
    return null;
  }

  void onSavePressed() async {
    final isVaild = formKey.currentState!.validate();

    if (isVaild) {
      formKey.currentState!.save();

      final database = GetIt.I<AppDatabase>();

      if (widget.id == null) {
        await database.createSchedule(ScheduleTableCompanion(
          startTime: Value(startTime!),
          endTime: Value(endTime!),
          content: Value(content!),
          date: Value(widget.selectedDay),
          colorId: Value(selectedColorId!),
        ));
      } else {
        await database.updateScheduleById(
            widget.id!,
            ScheduleTableCompanion(
              startTime: Value(startTime!),
              endTime: Value(endTime!),
              content: Value(content!),
              date: Value(widget.selectedDay),
              colorId: Value(selectedColorId!),
            ));
      }

      Navigator.of(context).pop();
    }
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;
  final FormFieldValidator<String> onStartValidate;
  final FormFieldValidator<String> onEndValidate;
  final String? startTimeInitValue;
  final String? endTimeInitValue;

  _Time({
    super.key,
    required this.onStartSaved,
    required this.onEndSaved,
    required this.onStartValidate,
    required this.onEndValidate,
    this.startTimeInitValue,
    this.endTimeInitValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: '시작 시간',
                onSaved: onStartSaved,
                validator: onStartValidate,
                initialValue: startTimeInitValue,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: CustomTextField(
                label: '마감 시간',
                onSaved: onEndSaved,
                validator: onEndValidate,
                initialValue: endTimeInitValue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> onValidate;
  final String? initialValue;

  const _Content({
    super.key,
    required this.onSaved,
    required this.onValidate,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        label: '내용',
        expand: true,
        onSaved: onSaved,
        validator: onValidate,
        initialValue: initialValue,
      ),
    );
  }
}

typedef OnColorSelected = void Function(int color);

class _Categories extends StatelessWidget {
  final int selectedColor;
  final OnColorSelected onTap;

  const _Categories({
    super.key,
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetIt.I<AppDatabase>().getCategories(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // 데이터가 없을 때
            return Container();
          }
          return Row(
            children: snapshot.data!
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () => onTap(e.id),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(
                            int.parse(
                              'FF${e.color}',
                              radix: 16,
                            ),
                          ),
                          border: e.id == selectedColor
                              ? Border.all(
                                  color: Colors.black,
                                  width: 4.0,
                                )
                              : null,
                          shape: BoxShape.circle,
                        ),
                        width: 32.0,
                        height: 32.0,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        });
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
            child: Text('저장'),
          ),
        ),
      ],
    );
  }
}
