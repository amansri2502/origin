import 'package:flutter/material.dart';
import '../styleguide/text_styles.dart';
import '../styleguide/colors.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RoundedImage extends StatelessWidget {
  final String name;
  final bool isOnline;
  final bool showRank;
  final int rank;
  final String imagePath;
  final double imageSize = 80;

  RoundedImage(
      {this.isOnline = false,
      @required this.imagePath,
      this.showRank = false,
      this.name,
      this.rank});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: imageSize +8,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Stack(
            children: <Widget>[
              CustomPaint(
                painter: RoundedImageBorder(isOnline: isOnline),
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  child: ClipOval(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (showRank)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: ClipOval(
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(gradient: appGradient),
                      child: Center(
                        child: Text(
                          rank.toString(),
                          style: rankTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      if(name!=null)
      Text(name,style: bodyTextStyle,)
      ],
    );
  }
}

class RoundedImageBorder extends CustomPainter {
  final bool isOnline;

  RoundedImageBorder({this.isOnline});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint borderPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    if (isOnline) {
      borderPaint.shader = appGradient.createShader(
          Rect.fromCircle(center: center, radius: size.width / 2));
    } else {
      borderPaint.color = tertiaryTextColor;
    }

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(360), false, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
