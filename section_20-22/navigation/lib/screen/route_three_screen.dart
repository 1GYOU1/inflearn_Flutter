import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';
// import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return DefaultLayout(
      title: 'RouteTwoScreen',
      children: [
        Text(
          arguments.toString(),
          textAlign: TextAlign.center,
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 111111,
            );
          },
          child: Text('Push Route Three'),
        ),

        // pushReplacement
        OutlinedButton(
          onPressed: () {
            // [HomeScreen, RouteOneScreen, RouteTwoScreen, RouteThreeScreen]
            // push - [HomeScreen, RouteOneScreen, RouteTwoScreen, RouteThreeScreen]
            // pushReplacement - [HomeScreen, RouteOneScreen, RouteThreeScreen]
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return RouteThreeScreen();
                },
                settings: RouteSettings(
                  arguments: '123123',
                ),
              ),
            );
          },
          child: Text('Push Replacement'),
        ),

        // pushReplacementNamed
        OutlinedButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed('/three', arguments: '999');
          },
          child: Text('Push Replacement Named'),
        ),

        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/three',
              (route) {
                // 만약 삭제할거면 (Route Stack) false로 전환
                // 만약 삭제를 안할거면 true로 전환
                return route.settings.name == '/';
              },
              arguments: '9999999',
            );
          },
          child: Text('Push Named And Remove Until'),
        ),
      ],
    );
  }
}
