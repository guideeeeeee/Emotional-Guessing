import 'package:flutter/material.dart';

class Question {
  var qustionImg;
  final List<Answer> answersList;

  Question(this.qustionImg, this.answersList);
}

class Answer {
  var answerImg;
  final bool correct;

  Answer(this.answerImg, this.correct);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //add question

  list.add(Question('assets/picture/lv1/angryduck.jpg', [
    Answer('assets/emoicon/angry.png', true),
    Answer('assets/emoicon/happy.png', false),
    Answer('assets/emoicon/sad.png', false),
    Answer('assets/emoicon/wow.png', false),
  ]));

  list.add(Question('assets/picture/lv1/bunnycry.jpg', [
    Answer('assets/emoicon/wow.png', false),
    Answer('assets/emoicon/happy.png', false),
    Answer('assets/emoicon/screaming.png', false),
    Answer('assets/emoicon/sad.png', true),
  ]));

  list.add(Question('assets/picture/lv1/happybaby.jpg', [
    Answer('assets/emoicon/nauseated.png', false),
    Answer('assets/emoicon/happy.png', true),
    Answer('assets/emoicon/sad.png', false),
    Answer('assets/emoicon/angry.png', false),
  ]));

  list.add(Question('assets/picture/lv1/scaredaino.jpg', [
    Answer('assets/emoicon/screaming.png', true),
    Answer('assets/emoicon/happy.png', false),
    Answer('assets/emoicon/wow.png', false),
    Answer('assets/emoicon/nauseated.png', false),
  ]));

  list.add(Question('assets/picture/lv1/wowbaby.jpg', [
    Answer('assets/emoicon/angry.png', false),
    Answer('assets/emoicon/sad.png', false),
    Answer('assets/emoicon/wow.png', true),
    Answer('assets/emoicon/happy.png', false),
  ]));

  return list;
}
