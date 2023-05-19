import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobileapp/game/gameover.dart';

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
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background.jpg"),
                        fit: BoxFit.cover)),
                child: Center(
                    child: Text(
                  timeLeft.toString(),
                  style: TextStyle(
                      fontFamily: 'FC Lamoon',
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )),
              ),
              if (isOver) // Conditionally show the gameOver widget
                gameOver(isOver: isOver, GameScore: GameScore,),
            ],
          ),
        ),
      ),
    );
  }
}
