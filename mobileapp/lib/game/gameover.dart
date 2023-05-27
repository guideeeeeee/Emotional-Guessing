import 'package:flutter/material.dart';
import 'package:mobileapp/user.dart';
import 'package:mobileapp/game/game.dart';

import 'inGame/levelpage.dart';

class gameOver extends StatelessWidget {
  final bool isOver;
  final int GameScore;
  gameOver({required this.isOver, required this.GameScore});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Container(
                color: Color.fromARGB(250, 153, 153, 255),
                child: Transform.translate(
                  offset: Offset(0, MediaQuery.of(context).size.height * 0.2),
                  child: Column(children: [
                    Text(
                      "จบเกม!",
                      style: TextStyle(fontFamily: 'ZFTERMIN__', fontSize: 72,color: Colors.white),
                    ),
                    Text(
                      "คะแนนรวม : $GameScore",
                      style: TextStyle(
                        fontFamily: 'FC Lamoon',
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                        color: Color.fromARGB(248, 238, 234, 123),
                        height: 1,
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => levelpage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: CircleBorder(),
                              ),
                              child: Container(
                                width: 85,
                                height: 325,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(250, 153, 153, 255),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Image.asset(
                                    'image/again2.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 100),
                          Flexible(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => user()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: CircleBorder(),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Image.asset(
                                  'image/backtohome2.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          );
  }
}
