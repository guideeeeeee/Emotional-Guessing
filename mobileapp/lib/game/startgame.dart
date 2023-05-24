import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobileapp/record/provider/replay.dart';
import 'package:mobileapp/game/game.dart';

class startgame extends StatelessWidget {
  const startgame({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => replay(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: game(),
      ),
    );
  }
}