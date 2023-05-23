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
        ChangeNotifierProvider(create: (context){
          return replay();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const game(),
      ),
    );
  }
}