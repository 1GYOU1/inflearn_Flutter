import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/component/number_to_image.dart';

class SettingScreen extends StatefulWidget {
  final int maxNumber;

  const SettingScreen({super.key, required this.maxNumber});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000; // 최대 숫자 - 슬라이드에서 던져주는 형태가 double

  // state가 생성되면 무조건 첫 번째 한번만 실행되는 함수
  initState() {
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Number(
                maxNumber: maxNumber,
              ),
              _Slider(
                value: maxNumber,
                onChanged: onSliderChanged,
              ),
              _Button(
                onPressed: onSavePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSavePressed() {
    Navigator.of(context).pop(
      maxNumber.toInt(),
    ); // 뒤로 가기
  }

  // 슬라이더 값 변경 시 호출되는 함수
  onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onPressed;

  const _Button({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text('저장'),
    );
  }
}

class _Number extends StatelessWidget {
  final double maxNumber;

  const _Number({super.key, required this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            NumberToImage(number: maxNumber.toInt()), // 숫자 이미지 컴포넌트 사용
          ],
        ),
      ),
    );
  }
}

// 슬라이더
class _Slider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _Slider({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 1000,
      max: 100000,
      activeColor: redColor,
      onChanged: onChanged,
    );
  }
}
