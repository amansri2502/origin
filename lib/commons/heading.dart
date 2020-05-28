import 'package:flutter/material.dart';
import '../styleguide/text_styles.dart';

class Heading extends StatelessWidget {
  final String s;
  Heading({@required this.s});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(s, style: headingOneTextStyle),
    );
  }
}
