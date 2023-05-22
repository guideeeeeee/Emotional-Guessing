import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobileapp/record/provider/replay.dart';
import 'package:mobileapp/game/game.dart';

class startgame extends StatelessWidget {
  const startgame({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<replay>.value(
          value: replay(), // สร้าง instance ของ Replay
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: game(),
      ),
    );
  }
}