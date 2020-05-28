import 'package:flutter/material.dart';

import 'package:stedia/styleguide/text_styles.dart';
import './models/last_played_game.dart';
import './commons/growth_indicator.dart';

class LastPlayedGameTile extends StatelessWidget {
  final LastPlayedGame lastPlayedGame;
  final double screenSize;

  LastPlayedGameTile(
      {@required this.lastPlayedGame, @required this.screenSize});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image.asset(
                        lastPlayedGame.imagePath,
                        height: 60,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 8,
                      right: 8,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.redAccent,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: lastPlayedGame.name.toString(),
                            style: headingTwoTextStyle),
                        TextSpan(text: "\n"),
                        TextSpan(
                            text:
                                "${lastPlayedGame.hoursPlayed.toString()} hours played",
                            style: bodyTextStyle)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GrowthIndicator(
            screenSize: screenSize,
            progress: lastPlayedGame.gameProgress,
          )
        ],
      ),
    );
  }
}
