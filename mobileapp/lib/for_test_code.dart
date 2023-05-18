import 'dart:async';
import 'package:mobileapp/game/gameover.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/game/game.dart';
void main() {
  runApp(game());
}

class game extends StatefulWidget {
  const game({Key? key});

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  int timeLeft = 5;

  @override
  void initState() {
    super.initState();
    startCountDown();
  }

  void startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        _gameOver();
      }
    });
  }

  void _gameOver() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => gameOver()),
    );
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
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    timeLeft.toString(),
                    style: TextStyle(
                      fontFamily: 'FC Lamoon',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

