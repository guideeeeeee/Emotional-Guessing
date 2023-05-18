import 'package:flutter/material.dart';
import 'package:mobileapp/game/gameover.dart';

void main() {
  runApp(gameOver());
}

class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
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
                child: Transform.translate(
                  offset: Offset(
                      0, MediaQuery.of(context).size.height * 0.2),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // link to game
                        },
                        child: Text(
                          "เริ่มเกม",
                          style: TextStyle(
                              fontFamily: 'FC Lamoon',
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // link to ประวัติ
                        },
                        child: Text(
                          "ประวัติการเล่น",
                          style: TextStyle(
                              fontFamily: 'FC Lamoon',
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 66,
                right:10,
                child: GestureDetector(
                  onTap: () {
                    // link to other page
                  },
                  child: ClipOval(
                    child: Image.asset(
                      "assets/aquacry.jpg",
                      width: 50,
                      height: 50,
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
