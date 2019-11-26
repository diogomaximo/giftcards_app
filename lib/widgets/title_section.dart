import 'package:flutter/material.dart';

class TitleSection extends StatefulWidget {
  String text;
  double topSpace;
  double fontSize;
  double leftSpace;

  TitleSection(this.text, {this.topSpace = 60.0, this.fontSize = 30.0, this.leftSpace: 20.0});

  @override
  _TitleSectionState createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding:
              EdgeInsets.only(top: widget.topSpace, left: widget.leftSpace),
          child: Text(
            super.widget.text,
            style: TextStyle(
                fontSize: widget.fontSize, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
