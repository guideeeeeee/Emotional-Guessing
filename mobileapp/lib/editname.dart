import "package:flutter/material.dart";
import 'package:mobileapp/user.dart';
class editname extends StatefulWidget {
  const editname({super.key});

  @override
  State<editname> createState() => _editnameState();
}

class _editnameState extends State<editname> {
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => user()),
                            );
                          },
                          child: Text(
                            "ยืนยัน",
                            style: TextStyle(
                                fontFamily: 'FC Lamoon',
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
