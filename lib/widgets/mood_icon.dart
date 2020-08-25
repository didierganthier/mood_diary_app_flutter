import 'package:flutter/material.dart';

class MoodIcon extends StatelessWidget {
  final String image;
  final String name;
  final Color color;

  MoodIcon({this.image, this.name, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            image,
            height: 45,
            width: 45,
          ),
          Text(name)
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: color),
      ),
      height: 75,
      width: 55,
    );
  }
}
