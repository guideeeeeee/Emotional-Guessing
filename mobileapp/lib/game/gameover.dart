import 'package:flutter/material.dart';
import 'package:mobileapp/user.dart';
import 'package:mobileapp/game/game.dart';

class gameOver extends StatelessWidget {
  final bool isOver;
  final int GameScore;
  gameOver({required this.isOver, required this.GameScore});
  @override
  Widget build(BuildContext context) {
    return isOver
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Builder(
                builder: (context) => Stack(
                  children: [
                    Container(
                        //set background image
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/background.jpg"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: Offset(
                              0, MediaQuery.of(context).size.height * 0.2),
                          child: Column(
                            children: [
                              Text(
                                "หมดเวลา!",
                                style: TextStyle(
                                    fontFamily: 'FC Lamoon',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 72),
                              ),
                              Text(
                                "คะแนนรวม : $GameScore",
                                style: TextStyle(
                                    fontFamily: 'FC Lamoon',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 42),
                              ),
                              SizedBox(height: 150),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => game()),
                                  );
                                },
                                child: Text(
                                  "เริ่มใหม่",
                                  style: TextStyle(
                                      fontFamily: 'FC Lamoon',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.pink), // change the color here
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => user()),
                                    );
                                  },
                                  child: Text(
                                    "กลับหน้าหลัก",
                                    style: TextStyle(
                                        fontFamily: 'FC Lamoon',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.pink),
                                  ))
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
