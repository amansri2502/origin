import 'package:flutter/material.dart';
import 'package:stedia/styleguide/text_styles.dart';

class PopularGames extends StatelessWidget {
  final String imagePath;
  PopularGames({@required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom:12.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(imagePath)),
          ),
          Positioned(
            left:10,bottom: -5,right: 10,
                      child: RaisedButton( 
              onPressed: () {},
              elevation: 1,
              color: Colors.white,
              child: Text(
                "Play",
                style: playWhiteTextStyle,
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
