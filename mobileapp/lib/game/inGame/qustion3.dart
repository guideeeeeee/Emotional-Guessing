import 'package:flutter/material.dart';

class Question3 {
  var qustionImg2;
  final List<Answer3> answersList3;

  Question3(this.qustionImg2, this.answersList3);
}

class Answer3 {
  var answerImg3;
  final bool correct3;

  Answer3(this.answerImg3, this.correct3);
}

List<Question3> getQuestions() {
  List<Question3> list = [];
  //add question

  list.add(Question3('assets/picture/lv3/winwin.jpg', [
    Answer3('assets/emoicon/sad.png', false),
    Answer3('assets/emoicon/happy.png', true),
    Answer3('assets/emoicon/screaming.png', false),
    Answer3('assets/emoicon/wow.png', false),
  ]));

  list.add(Question3('assets/picture/lv3/scareboy.jpg', [
    Answer3('assets/emoicon/wow.png', false),
    Answer3('assets/emoicon/screaming.png', true),
    Answer3('assets/emoicon/sad.png', false),
    Answer3('assets/emoicon/angry.png', false),
  ]));

  list.add(Question3('assets/picture/lv3/icecry.jpg', [
    Answer3('assets/emoicon/sad.png', true),
    Answer3('assets/emoicon/happy.png', false),
    Answer3('assets/emoicon/wow.png', false),
    Answer3('assets/emoicon/screaming.png', false),
  ]));

  list.add(Question3('assets/picture/lv3/happyfootball.jpg', [
    Answer3('assets/emoicon/angry.png', false),
    Answer3('assets/emoicon/wow.png', false),
    Answer3('assets/emoicon/happy.png', true),
    Answer3('assets/emoicon/nauseated.png', false),
  ]));

  list.add(Question3('assets/picture/lv3/angrygirl.jpg', [
    Answer3('assets/emoicon/happy.png', false),
    Answer3('assets/emoicon/nauseated.png', false),
    Answer3('assets/emoicon/sad.png', false),
    Answer3('assets/emoicon/angry.png', true),
  ]));

  return list;
}
