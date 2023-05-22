import 'dart:async';
import 'package:flutter/material.dart';

class game extends StatefulWidget {
  const game({super.key});

  @override
  State<game> createState() => _gameState();
}

//รอนายมาช่วยทำ
class _gameState extends State<game> {
  bool isOver = false;
  int timeLeft = 5;
  int GameScore = 0;

  void StartCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        setState(() {
          timer.cancel();
          isOver = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    StartCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
          builder: (context) => Stack(
            children: [
                //part game here
                Center(
                    child: Text(
                  timeLeft.toString(),
                  style: TextStyle(
                      fontFamily: 'FC Lamoon',
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )),
              
              //part gameover here
            ],
          ),
        ),
      ),
    );
  }
}
