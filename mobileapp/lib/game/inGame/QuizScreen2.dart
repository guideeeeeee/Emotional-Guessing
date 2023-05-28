import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../proflie/PlayerName.dart';
import '../../record/model/replayModel.dart';
import '../../record/provider/replay.dart';
import '../gameover.dart';
import 'qustion2.dart';
import 'levelpage.dart';

bool isActive = true;

class QuizScreen2 extends StatefulWidget {
  const QuizScreen2({Key? key}) : super(key: key);

  @override
  State<QuizScreen2> createState() => _QuizScreen2State();
}

class _QuizScreen2State extends State<QuizScreen2> {
// Declare _stopwatchWidget as nullable

  //define the datas
  List<Question2> questionList = getQuestions();
  int currentQusetionTndex = 0;
  int score = 0;
  Answer2? selectedAnswer;

//////////////////////////////StopWatch/////////////////////////////////////////
  int Rseconds = 0;
  int minutes = 0;
  int seconds = 0;
  String timeout = '00:00';

  @override
  void dispose() {
    isActive = false; // ปิดการทำงานของลูป
    super.dispose();
  }

  Stream<String> timer() async* {
    while (isActive) {
      await StartTime();
      yield await getFormattedTime();
      await Future.delayed(Duration(milliseconds: 500));
    }
  }

  Future<void> StartTime() async {
    if (isActive) {
      await Future.delayed(Duration(milliseconds: 500));
      if (isActive) {
        Rseconds++;
      }
      ;
    }
  }

  Future<String> getFormattedTime() async {
    minutes = Rseconds ~/ 60;
    seconds = Rseconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              "LEVEL 2",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 145, 210, 255)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _questionWidget(),
            SizedBox(
              height: 15,
            ),
            GridButton(),
            SizedBox(
              height: 15,
            ),
            _nextButton(),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 181),
    );
  }

  Widget _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "คำถามที่ ${currentQusetionTndex + 1}/${questionList.length.toString()}",
              style: TextStyle(
                fontFamily: 'FC Lamoon',
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: Container()),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                child: ButtonTheme(
                  minWidth: 500.0,
                  height: 100.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Center(
                        child: StreamBuilder<String>(
                            stream: timer(),
                            builder: (context, snapshot) {
                              final text = snapshot.data ?? '';
                              return Text(
                                "เวลา: " + text,
                                style: TextStyle(
                                  fontFamily: 'FC Lamoon',
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            })),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10.0),
                      primary: Color.fromARGB(255, 255, 0, 153),
                      onPrimary: Colors.black,
                      shadowColor: Color.fromARGB(255, 255, 166, 22),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: 250,
          child: Center(
            child: Container(
              child:
                  Image.asset(questionList[currentQusetionTndex].qustionImg2),
              height: 250,
              width: 225,
            ),
          ),
        ),
      ],
    );
  }

  Widget GridButton() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
            ),
            _answerButton(questionList[currentQusetionTndex].answersList2[0]),
            SizedBox(width: 20),
            _answerButton(questionList[currentQusetionTndex].answersList2[1]),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 40,
            ),
            _answerButton(questionList[currentQusetionTndex].answersList2[2]),
            SizedBox(width: 20),
            _answerButton(questionList[currentQusetionTndex].answersList2[3]),
          ],
        )
      ],
    );
  }

  Widget _answerButton(Answer2 answer) {
    bool isSelected = answer == selectedAnswer;

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (selectedAnswer == null) {
              if (answer.correct2) {
                score++;
              }
            }
            setState(() {
              selectedAnswer = answer;
              Rseconds--;
            });
          },
          child: Image.asset(answer.answerImg2),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            fixedSize: Size(130, 130),
            primary:
                isSelected ? Color.fromARGB(255, 167, 218, 255) : Colors.white,
            onPrimary: isSelected ? Colors.white : Colors.black,
            shadowColor: Color.fromARGB(255, 244, 174, 54),
          ),
        )
      ],
    );
  }

  Widget _nextButton() {
    bool isLastQuestion = false;
    if (currentQusetionTndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    return Container(
      child: ElevatedButton(
        onPressed: () async {
          if (isLastQuestion) {
            isActive = false;
            // Get player name from provider
            var playerName = context.read<PlayerName>();
            String? thisPlayerName = await playerName.getPlayerName();

            // Create new replay model
            replayModel newReplay = replayModel(
                thisPlayerName!, score, DateTime.now(), "LVL 2", Rseconds);

            // Add replay to provider
            var replayProvider = context.read<replay>();
            replayProvider.addReplay(newReplay);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      gameOver(isOver: true, GameScore: score)),
            );
            // Display score
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return AlertDialog(
            //       title: Text("Your score is " + score.toString()),
            //       content: ElevatedButton(
            //         onPressed: () {
            //           setState(() {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => levelpage(),
            //               ),
            //             );
            //           });
            //         },
            //         child: const Text("HOME"),
            //       ),
            //     );
            //   },
            // );
          } else {
            // Next question
            setState(() {
              selectedAnswer = null;
              currentQusetionTndex++;
              Rseconds--;
            });
          }
        },
        child: Text(
          isLastQuestion ? "ยืนยัน" : "ถัดไป",
          style: TextStyle(
            fontFamily: 'FC Lamoon',
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(2.0),
          fixedSize: Size(100, 27),
          primary: Color.fromARGB(255, 255, 0, 153),
          shadowColor: Colors.red,
        ),
      ),
    );
  }
}
