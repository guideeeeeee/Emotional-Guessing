// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'QuizScreen.dart';
import 'QuizScreen2.dart';
import 'QuizScreen3.dart';
class levelpage extends StatelessWidget {
  const levelpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  // faction build ทำหน้าที่แสดงผลออกทางหน้าจอ
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "EMOTIONAL GUESSING",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 0, 153),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizScreen()));
                  });
                },
                child: Text("LEVEL 1"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20.0),
                  textStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  primary: Color.fromARGB(255, 156, 155, 235),
                  shadowColor: Colors.black,
                  fixedSize: Size(400, 100),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizScreen2()));
                  });
                },
                child: Text("LEVEL 2"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20.0),
                  textStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  primary: Color.fromARGB(255, 145, 210, 255),
                  shadowColor: Colors.black,
                  fixedSize: Size(400, 100),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizScreen3()));
                  });
                },
                child: Text("LEVEL 3"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20.0),
                  textStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  primary: Color.fromARGB(255, 121, 218, 199),
                  shadowColor: Colors.black,
                  fixedSize: Size(400, 100),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 181),
    );
  }
}
