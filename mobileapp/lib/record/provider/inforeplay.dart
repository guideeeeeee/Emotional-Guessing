import 'package:flutter/material.dart';

class info extends StatelessWidget {
  final String name;
  final String score;
  final DateTime date;
  info({required this.name, required this.score , required this.date});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey[200],
        height: 50,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              Text(date.toString()),
              Text(score),
            ],
          ),
        ),
      ),
    );
  }
}
