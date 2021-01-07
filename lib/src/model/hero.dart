import 'package:flutter/cupertino.dart';
import 'package:hero/src/util/constraints.dart';

class Hero {
  int id;
  String name;
  int health = 0;
  int charisma = 0;
  int stamina = 0;
  Origin origin;

  Hero ({
    @required this.id,
    @required this.name,
    @required this.health,
    @required this.charisma,
    @required this.stamina,
    @required this.origin
  });

  String convertOrigin() {
    switch(origin) {
      case Origin.DC:
        return "DC";
        break;
      case Origin.Marvel:
        return "Marvel";
        break;
      default:
        return "Unknown";
    }
  }
}