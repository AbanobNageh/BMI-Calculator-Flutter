import 'package:flutter/material.dart';

class BackgroundCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onTap;

  BackgroundCard({@required this.color, this.cardChild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
        margin: EdgeInsets.all(10.0),
      ),
    );
  }
}
