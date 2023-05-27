import 'package:flutter/material.dart';
import 'package:mobileapp/record/provider/replay.dart';
import 'package:mobileapp/user.dart';
import 'package:provider/provider.dart';
import 'model/replayModel.dart';

class record extends StatefulWidget {
  const record({Key? key});

  @override
  State<record> createState() => _recordState();
}

class _recordState extends State<record> {
  void initState() {
    super.initState();
    Provider.of<replay>(context, listen: false).initData();
  }
  @override
  Widget build(BuildContext context) {
    final replayProvider = Provider.of<replay>(context);
    print(replayProvider.replays.length);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 174, 242, 252),
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
                    Consumer<replay>(builder: (context, replayProvider, _) {
                  var count = replayProvider.replays.length;
                  if (count <= 0) {
                    return Center(
                      child: Text(
                        "ไม่มีประวัติการเล่น",
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
                          replayModel replayAll = replayProvider.replays[index];
                          return Card(
                            color: Colors.pink,
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(
                                vertical: 3.5, horizontal: 5),
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: FittedBox(
                                    child: Text(replayAll.score.toString(),style: TextStyle(color: Colors.black),),
                                  )),
                              title: Text(replayAll.name,style: TextStyle(color: Colors.white)),
                              subtitle: Text(replayAll.dateandTime.toString(),style: TextStyle(color: Colors.white)),
                            ),
                          ); 
                        });
                  }
                })),
                Container(
                  height: 100,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
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
                      SizedBox(
                        width: 60,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("ลบประวัติการเล่น"),
                                  content: Text(
                                    "การลบประวัติการเล่นจะไม่สามารถกู้คืนได้ คุณต้องการลบหรือไม่",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                      },
                                      child: Text("ยกเลิก"),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Provider.of<replay>(context, listen: false).deletedata();
                                        Navigator.pop(context);
                                      },
                                      child: Text("ตกลง"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "ลบประวัติ",
                            style: TextStyle(
                                fontFamily: 'FC Lamoon',
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.pink),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}