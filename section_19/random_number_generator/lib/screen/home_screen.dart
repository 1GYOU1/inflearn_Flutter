import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/screen/setting_screen.dart';
import 'package:random_number_generator/component/number_to_image.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [
    123,
    456,
    789,
  ];
  int maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0), // 좌우 padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// 제목, 아이콘 버튼 영역
              _Header(
                onPressed: onSettingIconPressed,
              ),

              /// 숫자 영역
              _Body(
                numbers: numbers,
              ),

              /// 버튼 영역
              _Footer(
                onPressed: generateRandomNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 설정 아이콘 누르면 호출되는 함수
  onSettingIconPressed() async {
    final result = await Navigator.of(context).push(
      // 홈 화면에서 설정 화면으로 이동(스크린 쌓기)
      MaterialPageRoute(builder: (context) {
        return SettingScreen(maxNumber: maxNumber);
      }),
    );

    maxNumber = result;
  }

  // 생성하기 버튼 누르면 호출되는 함수
  generateRandomNumber() {
    final rand = Random();

    final Set<int> randomNumbers = {};

    while (randomNumbers.length < 3) {
      final randomNumber = rand.nextInt(maxNumber);

      randomNumbers.add(randomNumber);
    }

    setState(() {
      numbers = randomNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;

  const _Header({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          color: redColor,
          onPressed: onPressed,
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> numbers;

  const _Body({super.key, required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numbers
            .map((e) => NumberToImage(number: e)) // 숫자 이미지 컴포넌트 사용
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor, // 버튼 배경색
        foregroundColor: Colors.white, // 버튼 글자색
      ),
      child: Text('생성하기!'),
    );
  }
}
