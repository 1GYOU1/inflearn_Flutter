import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              // onPressed: null,
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // 배경색
                disabledBackgroundColor: Colors.grey, // 비활성화 상태의 배경색
                foregroundColor: Colors.white, // 글자색
                shadowColor: Colors.green, // 그림자색
                elevation: 10, // 그림자 크기
                textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                padding: EdgeInsets.all(32.0),
                side: BorderSide(
                  color: Colors.black,
                  width: 12.0,
                ),
                // minimumSize: Size(300, 150), // 최소 버튼 크기 (minimumSize와 같이 사용할 수 없음)
                // maximumSize: Size(100, 150), // 최대 버튼 크기 (maximumSize와 같이 사용할 수 없음)
                // fixedSize: Size(100, 150), // 버튼 크기 고정
              ),
              child: Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.pink),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                minimumSize: WidgetStateProperty.all(Size(200, 150)),
              ),
              child: Text('Outlined Button'),
            ),
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      // 버튼을 누르고 있을 때
                      return Colors.red;
                    }
                    return Colors.black;
                  }),
                  foregroundColor: WidgetStateProperty.resolveWith(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      // 버튼을 누르고 있을 때
                      return Colors.black;
                    }
                    return Colors.white;
                  }),
                  minimumSize: WidgetStateProperty.resolveWith(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      // 버튼을 누르고 있을 때
                      return Size(100, 70);
                    }
                    return Size(150, 70);
                  }),
                ),
                child: Text('Text Button')),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: CircleBorder(
                  eccentricity: 0.7,
                ),
              ),
              child: Text('Outlined Button'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text('키보드'),
              icon: Icon(Icons.keyboard_alt_outlined),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text('키보드'),
              icon: Icon(Icons.keyboard_alt_outlined),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              label: Text('키보드'),
              icon: Icon(Icons.keyboard_alt_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
