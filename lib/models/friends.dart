import '../image_asset.dart';

class Friend {
  final String name;
  final String imagePath;
  final bool isOnline;

  const Friend({this.name, this.imagePath, this.isOnline});
}

final friends = [
  Friend(name: "Jennie", imagePath: jeenie, isOnline: true),
  Friend(name: "Gena", imagePath: gena, isOnline: false),
  Friend(name: "Michelle", imagePath: michelle, isOnline: false),
  Friend(name: "Trish", imagePath: trish, isOnline: false),
];