import 'package:flutter/material.dart';

const Color shapeColor = Color.fromRGBO(254, 197, 98, 0.7);
class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // set the paint color to be white
    paint.color = Colors.white;

    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.height, size.width);

    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);

//    paint.color = Colors.yellow;

    // create a path
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    // close the path to form a bounded shape
    path.close();

    canvas.drawPath(path, paint);

    // set the color property of the paint
    paint.color = shapeColor;

    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(30, -180);

    // draw the circle with center having radius 75.0
    canvas.drawCircle(center, 220.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class RightShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // set the paint color to be white
//    paint.color = Colors.white;

    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.height, size.width);

    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);

//    paint.color = Colors.red;

    // create a path
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    // close the path to form a bounded shape
    path.close();

    canvas.drawPath(path, paint);

    // set the color property of the paint
    paint.color = shapeColor;

    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(410, 90);

    // draw the circle with center having radius 75.0
    canvas.drawCircle(center, 200.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


class CircleSeparatorPainter extends CustomPainter {

  bool isInitial;

  CircleSeparatorPainter(this.isInitial);

  @override
  void paint(Canvas canvas, Size size) {
    double circleXPosition = 283;

    if (this.isInitial){
      circleXPosition = 0;
    }

    final paint = Paint();
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    // close the path to form a bounded shape
    path.close();
    canvas.drawPath(path, paint);

    // set the color property of the paint
    paint.color = Colors.white;

    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(circleXPosition, 0);

    // draw the circle with center having radius 75.0
    canvas.drawCircle(center, 8.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class LineDashedPainter extends CustomPainter {

  double width = 100.0;

  LineDashedPainter(this.width);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..strokeWidth = 2;
    paint.color = Colors.white;
    var max = width;
    var dashWidth = 2;
    var dashSpace = 3;
    double startY = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(startY, 0), Offset(startY + dashWidth,0), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}