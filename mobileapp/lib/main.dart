import 'package:flutter/material.dart';
import 'package:mobileapp/user.dart';

void main() {
  runApp(logoScreen());
}

class logoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover)),
          child: AlertDialog(
            title: Text("data"),
            content: Text("data"),
            actions: [
              MaterialButton(
                onPressed: () {
                  //Route:{
                  //  (context) => user();
                  //}
                  Navigator.push(
                      context,MaterialPageRoute(builder: (context) => const user()));
                },
                child: Text("OK"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
