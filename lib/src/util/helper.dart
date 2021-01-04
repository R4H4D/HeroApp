import 'package:hero/src/util/constraints.dart';
import 'package:hero/src/model/hero.dart';

class Helper {
  static List<ActionHero> getAllHeroes() {
    return heroes;
  }

  static ActionHero getHeroById(int id) {
    return heroes.firstWhere((item) => item.id == id);
  }

  // ignore: missing_return
  static bool createHero(ActionHero hero) {
    heroes.add(hero);
  }

  // ignore: missing_return
  static bool updateHero(ActionHero hero) {
    //heroes.firstWhere((item) => item.id==id);
    int index = heroes.indexWhere((item) => item.id == hero.id);
    heroes[index] = hero;
  }

  static List<ActionHero> searchHero(String key) {
    return heroes
        .where((item) => item.name.toLowerCase().contains(key.toLowerCase()))
        .toList();
  }

  static bool deleteHero(int id) {
    int index = heroes.indexWhere((item) => item.id == id);
    return heroes.remove(index);
  }

  // ignore: missing_return
  static ActionHero duplicateHero(ActionHero hero) {
    heroes.add(hero);
    heroes.add(hero);
  }
}