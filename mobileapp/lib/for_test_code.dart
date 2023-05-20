import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobileapp/game/gameover.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobileapp/record/record.dart';
import 'package:mobileapp/record/provider/inforeplay.dart';
void main() {
  runApp(Record());
}
class Record extends StatefulWidget {
  const Record({Key? key}) : super(key: key);

  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
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
            ),
            Column(
              children: [
                Container(
                  height: 150,
                  child: Center(
                    child: Text(
                      "ประวัติการเล่น",
                      style: TextStyle(
                        fontFamily: 'FC Lamoon',
                        fontWeight: FontWeight.bold,
                        fontSize: 56,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.deepPurple.shade100,
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            info(name: "guide", score: "20", date: DateTime.now()),
                            info(name: "guide", score: "20", date: DateTime.now()),
                            info(name: "guide", score: "20", date: DateTime.now()),
                            info(name: "guide", score: "20", date: DateTime.now()),
                            info(name: "guide", score: "20", date: DateTime.now()),
                            info(name: "guide", score: "20", date: DateTime.now()),
                            info(name: "guide", score: "20", date: DateTime.now()),
                            info(name: "guide", score: "20", date: DateTime.now()),
                            info(name: "guide", score: "20", date: DateTime.now()),
                            info(name: "guide", score: "20", date: DateTime.now()),
                            info(name: "guide", score: "20", date: DateTime.now()),
                            info(name: "guide", score: "20", date: DateTime.now()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child: Center(
                    child: Text("Back"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
