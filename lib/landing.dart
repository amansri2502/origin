import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './Second_page.dart';
import './commons/Rounded_image.dart';
import './commons/heading.dart';
import './models/friends.dart';
import './models/last_played_game.dart';
import './styleguide/text_styles.dart';
import './styleguide/colors.dart';
import "./image_asset.dart";
import './last_played_game_widget.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final logoHeight = screenHeight * 0.33;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(screenWidth * 0.4, 8), // moves logo on x and y axis
            child: Transform.rotate(
              angle: -0.2, // rotates logo
              child: SvgPicture.asset(
                // svg package is needed in pubspec
                logo,
                height: logoHeight,
                color: logoTintColor,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>SecondPage()));
                      },
                                              child: Icon( 
                          Icons.menu,
                          color: primaryTextColor,
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: primaryTextColor,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: <Widget>[
                            RoundedImage(
                                imagePath: jon,
                                isOnline: true,
                                showRank: true,
                                rank: 40),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Hi", style: userNameTextStyle),
                                    TextSpan(text: "\n"),
                                    TextSpan(
                                        text: "Jon Snow",
                                        style: userNameTextStyle)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 16, right: 16),
                        child: Material(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "HOURS PLAYED",
                                      style: hoursPlayedLabelTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "287 Hours",
                                  style: hoursPlayedTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Heading(s: "Last Played Game"),
                      for (int i = 0; i < lastPlayedGames.length; i++)
                        LastPlayedGameTile(
                          lastPlayedGame: lastPlayedGames[i],
                          screenSize: screenWidth,
                        ),
                      Heading(s: "Friends"),
                    ],
                  ),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: <Widget>[
                          for (int i = 0; i < friends.length; i++)
                            RoundedImage(
                              imagePath: friends[i].imagePath,
                              name: friends[i].name,
                              isOnline: friends[i].isOnline,
                            ),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
