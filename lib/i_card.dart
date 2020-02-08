import 'package:flutter/material.dart';

class ICard extends StatelessWidget {
  ICard(
      {this.key,
      this.onClick,
      this.child,
      this.color = const Color(0xFF2B0E58),
      this.margin = const EdgeInsets.all(15)});

  final Widget child;
  final Color color;
  final EdgeInsets margin;
  final Key key;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: onClick,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
