import 'package:flutter/cupertino.dart';
import 'package:hero/src/util/constraints.dart';

class Hero {
  int id;
  String name;
  int health = 1;
  int charisma = 1;
  int stamina = 1;
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
      case Origin.None:
        return null;
        break;
      default:
        return "Unknown";
    }
  }
}