import 'package:flutter/material.dart';
import 'package:mobileapp/proflie/PlayerName.dart';
import 'package:mobileapp/proflie/editname.dart';
import 'package:mobileapp/proflie/editname2.dart';
import 'package:mobileapp/record/provider/replay.dart';
import 'package:mobileapp/record/record.dart';
import 'package:provider/provider.dart';

import 'game/startgame.dart';

class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => replay()),
        ChangeNotifierProvider(create: (context) => PlayerName('yourname')),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Builder(
            builder: (context) => Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 174, 242, 252)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            'image/logoonscreenNOBG.png',
                            width: 300,
                            height: 300,
                          ),
                        ),
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
                Positioned(
                  top: 66,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => EditUser()),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        "image/w.png",
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
      ),
    );
  }
}
