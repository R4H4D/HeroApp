import 'package:hero/src/model/hero.dart';

enum Origin {
  DC,
  Marvel,
  None,
}

Map<int, Hero> heroes = {
  0: Hero(
    id: 1,
    name: "Batman",
    health: 65,
    stamina: 70,
    charisma: 95,
    origin: Origin.DC,
    //image: "assets/images/batman.jpg",
  ),
  1: Hero(
    id: 2,
    name: "Superman",
    health: 100,
    stamina: 100,
    charisma: 90,
    origin: Origin.DC,
    //image: "assets/images/superman.jpg",
  ),
  2: Hero(
    id: 3,
    name: "Joker",
    health: 60,
    stamina: 60,
    charisma: 100,
    origin: Origin.DC,
    //image: "assets/images/joker.jpg",
  ),
  3: Hero(
    id: 4,
    name: "Captain America",
    health: 90,
    stamina: 100,
    charisma: 90,
    origin: Origin.Marvel,
    //image: "assets/images/captain.jpg",
  ),
  4: Hero(
    id: 5,
    name: "Iron Man",
    health: 85,
    stamina: 85,
    charisma: 95,
    origin: Origin.Marvel,
    //image: "assets/images/iron_man.jpg",
  ),
};