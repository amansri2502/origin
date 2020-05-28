import 'package:flutter/material.dart';
import 'package:stedia/styleguide/colors.dart';

class GrowthIndicator extends StatefulWidget {
  final double screenSize;
  final double progress;

  GrowthIndicator({@required this.screenSize, @required this.progress});

  @override
  _GrowthIndicatorState createState() => _GrowthIndicatorState();
}

class _GrowthIndicatorState extends State<GrowthIndicator>
    with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> progressAnimation;
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    progressAnimation = Tween<double>(begin: 0, end: (widget.screenSize * 0.33 - 24)*widget.progress )
        .animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   final size = widget.screenSize * 0.33 - 24;

    return AnimatedBuilder(
        animation: progressAnimation,
        builder: (context, widget) {
          return Stack(
            children: <Widget>[
              Container(
                width: size,
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    border: Border.all(color: tertiaryTextColor, width: 1)),
              ),
              Container(
                width: progressAnimation.value,
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    gradient: appGradient),
              ),
            ],
          );
        });
  }
}
