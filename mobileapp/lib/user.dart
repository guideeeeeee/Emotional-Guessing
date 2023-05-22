import 'package:flutter/material.dart';
import 'package:mobileapp/proflie/editname.dart';
import 'package:mobileapp/record/record.dart';

import 'game/startgame.dart';
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
                  offset: Offset(0, MediaQuery.of(context).size.height * 0.2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => startgame()),
                            );
                        },
                        child: Text(
                          "เริ่มเกม",
                          style: TextStyle(
                              fontFamily: 'FC Lamoon',
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.pink), // change the color here
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => record()),
                            );
                          },
                          child: Text(
                            "ประวัติการเล่น",
                            style: TextStyle(
                                fontFamily: 'FC Lamoon',
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.pink),
                          ))
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 66,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => editname()),
                    );
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
