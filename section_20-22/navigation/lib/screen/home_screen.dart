import 'package:flutter/material.dart';
import 'package:navigation/screen/route_one_screen.dart';
import 'package:navigation/layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Home',
      children: [
        OutlinedButton(
          onPressed: () async {
            final result = await Navigator.of(context).push<int>(
              MaterialPageRoute(
                builder: (context) => RouteOneScreen(number: 20),
              ),
            );
            print(result);
          },
          child: Text('Push'),
        ),
      ],
    );
  }
}
