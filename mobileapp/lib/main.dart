import 'package:flutter/material.dart';
import 'package:mobileapp/record/provider/replay.dart';
import 'package:mobileapp/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<replay>(
      create: (context) => replay(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Splash(),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isPressed = true;
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isDarkMode ? Color.fromARGB(255, 174, 242, 252) : Colors.white;
    Offset distance = isPressed ? const Offset(10, 10) : const Offset(28, 28);
    double blur = isPressed ? 5.0 : 30.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              child: GestureDetector(
                onTap: () => setState(() => isPressed = !isPressed),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isPressed
                        ? (isDarkMode
                            ? Color.fromARGB(255, 156, 232, 223)
                            : Colors.blue)
                        : backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: blur,
                        offset: -distance,
                        color: isDarkMode
                            ? Color.fromARGB(255, 199, 246, 253)
                            : Colors.transparent,
                        spreadRadius: isPressed ? 5 : -10,
                      ),
                      BoxShadow(
                        blurRadius: blur,
                        offset: distance,
                        color: isDarkMode
                            ? Color.fromARGB(255, 79, 108, 112)
                            : Color.fromARGB(0, 29, 22, 22),
                        spreadRadius: isPressed ? 0 : -10,
                      ),
                    ],
                  ),
                  height: 550,
                  width: 330,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'ข้อแนะนำ\n\n1.กำหนดเวลาเล่น: กำหนดเวลาเล่นเกมเพื่อป้องกันการใช้เวลาเกินไปและให้เด็กมีเวลาที่เหลือในวันสำหรับกิจกรรมอื่นๆ\n\n2.ติดตามและสนับสนุน: สนับสนุนและสนใจในการเล่นเกมของเด็ก สอบถามเกี่ยวกับประสบการณ์ในเกมและเรียนรู้เกี่ยวกับทักษะที่พัฒนาขึ้นจากการเล่น\n\n3.ติดต่อผู้เชี่ยวชาญ: พูดคุยกับผู้เชี่ยวชาญเพื่อขอคำปรึกษาเพิ่มเติมเกี่ยวกับการเล่นเกมทายอารมณ์ในเด็กออทิสติกเทียม\n\nควรใช้ข้อแนะนำเหล่านี้เป็นแนวทางเพื่อดูแลและ\nกำกับการเล่นเกมของเด็กออทิสติกเทียมอย่างเหมาะสม\nแต่คุณควรพิจารณาตามสภาพความพร้อมและความต้องการ\nของเด็กเนื่องจากทุกเด็กออทิสติกเทียมอาจมีความแตกต่างกันไป\n\n',
                              style: TextStyle(
                                fontFamily: 'FC Lamoon',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode
                                    ? Color.fromARGB(255, 18, 17, 17)
                                    : Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 500,
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => user()),
                            );
                            },
                            child: Text('ตกลง',style: TextStyle(
                                fontFamily: 'FC Lamoon',fontSize: 20)) ,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:mobileapp/record/provider/replay.dart';
// import 'package:mobileapp/user.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(logoScreen());
// }

// class logoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             body: Container(
//                 width: double.infinity,
//                 height: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 85, 200, 186)),
//                 child: attention())));
//   }
// }

// class attention extends StatefulWidget {
//   const attention({super.key});

//   @override
//   State<attention> createState() => _attentionState();
// }

// class _attentionState extends State<attention> {
//   @override
//   void initState() {
//     super.initState();
//     int count = 0;
//     Timer.periodic(Duration(seconds: 3), (timer) {
//       setState(() {
//         _visible = !_visible;
//         count++;

//         if (count > 2) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => user()),
//           );
//           timer.cancel();
//         }
//       });
//     });
//   }

//   bool _visible = false;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//       opacity: _visible ? 1.0 : 0.0,
//       duration: const Duration(seconds: 1),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("คำแนะนำการใช้แอพพลิเคชัน",
//                 style: TextStyle(
//                     fontFamily: 'FC Lamoon',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 32)),
//             Text(
//               "ผู้ใหญ่ควรเล่นปล่อยให้เด็กงงกับโค้ดต่อไปในมื้อเช้าของเราที่จะเก็บในลาวาของคอมพิวเตอร์คีย์บอร์ดนาโนที่สูงใหญ่และเสียดสีแรงกล้าสุดแกร่ง",
//               style: TextStyle(fontFamily: 'FC Lamoon', fontSize: 18),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
