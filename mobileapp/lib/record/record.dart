import 'package:flutter/material.dart';
import 'package:mobileapp/record/provider/inforeplay.dart';
import 'package:mobileapp/user.dart';

class record extends StatefulWidget {
  const record({super.key});

  @override
  State<record> createState() => _recordState();
}

class _recordState extends State<record> {
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
                    child: ElevatedButton(
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
                                  )),
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
