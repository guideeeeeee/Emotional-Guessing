import 'package:flutter/material.dart';

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
              
            ],
          ),
        ),
      ),
    );
  }
}