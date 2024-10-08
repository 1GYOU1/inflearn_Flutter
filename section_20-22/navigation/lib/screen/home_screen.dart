import 'package:flutter/material.dart';
import 'package:navigation/screen/route_one_screen.dart';
import 'package:navigation/layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: DefaultLayout(
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
              Navigator.of(context).maybePop(
                456, // 값 되돌려 보내기
              );
            },
            child: Text('Maybe Pop'),
          ),
          OutlinedButton(
            onPressed: () {
              print(Navigator.of(context).canPop());
            },
            child: Text('Can Pop'),
          ),
        ],
      ),
    );
  }
}
