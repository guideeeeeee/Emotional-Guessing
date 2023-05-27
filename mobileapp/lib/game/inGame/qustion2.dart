import 'package:flutter/material.dart';

class Question2 {
  var qustionImg2;
  final List<Answer2> answersList2;

  Question2(this.qustionImg2, this.answersList2);
}

class Answer2 {
  var answerImg2;
  final bool correct2;

  Answer2(this.answerImg2, this.correct2);
}

List<Question2> getQuestions() {
  List<Question2> list = [];
  //add question

  list.add(Question2('assets/picture/lv2/angryman.jpg', [
    Answer2('assets/emoicon/sad.png', false),
    Answer2('assets/emoicon/happy.png', false),
    Answer2('assets/emoicon/angry.png', true),
    Answer2('assets/emoicon/screaming.png', false),
  ]));

  list.add(Question2('assets/picture/lv2/cryboy.jpg', [
    Answer2('assets/emoicon/sad.png', true),
    Answer2('assets/emoicon/angry.png', false),
    Answer2('assets/emoicon/happy.png', false),
    Answer2('assets/emoicon/wow.png', false),
  ]));

  list.add(Question2('assets/picture/lv2/happygang.jpg', [
    Answer2('assets/emoicon/screaming.png', false),
    Answer2('assets/emoicon/happy.png', true),
    Answer2('assets/emoicon/wow.png', false),
    Answer2('assets/emoicon/nauseated.png', false),
  ]));

  list.add(Question2('assets/picture/lv2/mandonteat.jpg', [
    Answer2('assets/emoicon/angry.png', false),
    Answer2('assets/emoicon/wow.png', false),
    Answer2('assets/emoicon/nauseated.png', true),
    Answer2('assets/emoicon/happy.png', false),
  ]));

  list.add(Question2('assets/picture/lv2/spider.jpg', [
    Answer2('assets/emoicon/nauseated.png', false),
    Answer2('assets/emoicon/sad.png', false),
    Answer2('assets/emoicon/happy.png', false),
    Answer2('assets/emoicon/screaming.png', true),
  ]));

  return list;
}
