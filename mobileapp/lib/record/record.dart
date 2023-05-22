import 'package:flutter/material.dart';
import 'package:mobileapp/record/provider/replay.dart';
import 'package:mobileapp/user.dart';
import 'package:provider/provider.dart';
import 'model/replayModel.dart';

class record extends StatefulWidget {
  const record({super.key});

  @override
  State<record> createState() => _recordState();
}

class _recordState extends State<record> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return replay();
        })
      ],
      child: MaterialApp(
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
                  Expanded(child:
                      Consumer<replay>(builder: (context, replay, _)  {
                        List<replayModel> replays = replay.getReplay();
                    var count = replay.replays.length;
                    if (count <= 0) { 
                      return Center(
                        child: Text(
                          "$count",
                          style: TextStyle(
                            fontFamily: 'FC Lamoon',
                            fontWeight: FontWeight.bold,
                            fontSize: 56,
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: count,
                          itemBuilder: (context, int index) {
                            replayModel replayAll = replay.replays[index];
                            return Container(
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(replays.toString()),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  })),
                  Container(
                    height: 100,
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => user()),
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
                                MaterialStateProperty.all<Color>(Colors.pink),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
