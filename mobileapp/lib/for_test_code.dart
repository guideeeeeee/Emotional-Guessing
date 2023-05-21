import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobileapp/user.dart';

void main() {
  runApp(editname());
}

class editname extends StatefulWidget {
  @override
  State<editname> createState() => _editnameState();
}

class _editnameState extends State<editname> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
              ),
              Positioned(
                top: 170,
                left: 100,
                child: GestureDetector(
                  onTap: () {
                    // เปลี่ยนภาพแต่ตอนนี้ยัง
                  },
                  child: ClipOval(
                    child: Image.asset(
                      "assets/aquacry.jpg",
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 400),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration:
                            new InputDecoration(labelText: "ชื่อผู้เล่นใหม่"),
                        style: TextStyle(
                            fontFamily: 'FC Lamoon',
                            fontWeight: FontWeight.normal),
                        validator: (value) {
                          if (value!.isEmpty)
                            return "โปรดระบุชื่อผู้เล่นใหม่";
                          else
                            return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 55),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => user()),
                              );
                            },
                            child: Text(
                              "ยกเลิก",
                              style: TextStyle(
                                  fontFamily: 'FC Lamoon',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                          SizedBox(width: 70),
                          ElevatedButton(
                            onPressed: () {
                              if(formKey.currentState!.validate()){
                                Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => user()),
                            );
                              }
                            },
                            child: Text(
                              "ยืนยัน",
                              style: TextStyle(
                                  fontFamily: 'FC Lamoon',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                        ],
                      )
                    ],
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
