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
            ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
            OutlinedButton(onPressed: () {}, child: Text('Outlined Button')),
            TextButton(onPressed: () {}, child: Text('Text Button')),
          ],
        ),
      ),
    );
  }
}
