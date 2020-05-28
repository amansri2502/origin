import '../image_asset.dart';

class LastPlayedGame {
  final String name;
  final int hoursPlayed;
  final String imagePath;
  final double gameProgress;

  const LastPlayedGame({this.name, this.hoursPlayed, this.imagePath, this.gameProgress});
}

final lastPlayedGames = [
  LastPlayedGame(name: "Assassin's Creed Odyssey", hoursPlayed: 10, gameProgress: 0.20, imagePath:assassins),
  LastPlayedGame(name: "Dead Cells", hoursPlayed: 50, gameProgress: 0.80, imagePath: dead),
  LastPlayedGame(name: "Stardew Valley", hoursPlayed: 90, gameProgress: 0.95, imagePath: stardew),
  LastPlayedGame(name: "No Man's Sky", hoursPlayed: 3, gameProgress: 0.10, imagePath:noMeans),
];

final popularWithFriends = [
  fortnite,apex,pubg,dead,assassins
];