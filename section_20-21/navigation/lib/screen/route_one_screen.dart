import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int number;

  const RouteOneScreen({
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Route One',
      children: [
        Text(
          'argument: $number',
          textAlign: TextAlign.center,
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop(
              456, // 값 되돌려 보내기
            );
          },
          child: Text('Pop'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return RouteTwoScreen();
                },
                // 다음 화면으로 이동할 때 값 전달
                settings: RouteSettings(
                  arguments: 789,
                ),
              ),
            );
          },
          child: Text('Push'),
        ),
      ],
    );
  }
}
