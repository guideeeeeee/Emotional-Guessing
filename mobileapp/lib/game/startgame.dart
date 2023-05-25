import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobileapp/record/provider/replay.dart';
import 'package:mobileapp/game/game.dart';

import '../proflie/PlayerName.dart';

class startgame extends StatelessWidget {
  const startgame({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => replay()),
        //ChangeNotifierProvider(create: (context) => PlayerName('yourname')),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: game(),
      ),
    );
  }
}
