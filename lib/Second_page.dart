import 'package:flutter/material.dart';
import 'package:stedia/commons/heading.dart';
import 'package:stedia/models/last_played_game.dart';
import 'package:stedia/styleguide/colors.dart';
import 'package:stedia/styleguide/text_styles.dart';
import './image_asset.dart';
import './popular_with_friends.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        gameImage,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 32),
                            child: Column(
                              children: <Widget>[
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "NEW GAME",
                                          style: newGameTextStyle),
                                      TextSpan(text: "\n"),
                                      TextSpan(
                                          text:
                                              "Assassin's Creed:The Rebel Collection",
                                          style: newGameNameTextStyle)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 6),
                                    decoration: BoxDecoration(
                                      gradient: appGradient,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child:
                                        Text("PLAY", style: newGameTextStyle),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Heading(s: "Popular With Friends"),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            for (int i = 0; i < popularWithFriends.length; i++)
                              PopularGames(imagePath: popularWithFriends[i])
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Heading(s: "Continue Playing"),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: appGradient,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(8)),
                                        child: Image.asset(
                                          lastPlayedGames[0].imagePath,
                                          height: 80,
                                          width: 60,
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
                                              text: lastPlayedGames[0]
                                                  .name
                                                  .toString(),
                                              style:newGameNameTextStyle),
                                          TextSpan(text: "\n"),
                                          TextSpan(
                                              text:
                                                  "${lastPlayedGames[0].hoursPlayed.toString()} hours played",
                                              style:newGameTextStyle.copyWith(fontWeight:FontWeight.normal ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
