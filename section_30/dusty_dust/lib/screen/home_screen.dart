import 'package:dusty_dust/const/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    '서울',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text('2024-11-1 11:00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  SizedBox(height: 20.0),
                  Image.asset(
                    'asset/img/good.png',
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  SizedBox(height: 20.0),
                  Text('보통',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w700,
                      )),
                  Text('나쁘지 않네요!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
