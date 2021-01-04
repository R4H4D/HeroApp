import 'package:hero/src/util/constraints.dart';

class ActionHero {
  int id;
  String name;
  int health = 0;
  int charisma = 0;
  int stamina = 0;
  Origin origin;
  String image;

  ActionHero( {
    this.id,
    this.name,
    this.health,
    this.charisma,
    this.stamina,
    this.origin,
    this.image,
    }
  );
}