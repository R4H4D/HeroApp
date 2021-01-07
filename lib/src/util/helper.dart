import 'package:hero/src/util/constraints.dart';
import 'package:hero/src/model/hero.dart';

class Helper {
  static List<Hero> getAllHeroes() {
    List<Hero> heroList = heroes;
    heroList.sort((a, b) => b.id.compareTo(a.id));
    return heroes;
  }

  static Hero getHeroById(int id) {
    return heroes.firstWhere((hero) => hero.id == id);
  }

  static bool createHero(Hero hero) {
    try {
      heroes.add(hero);
      return true;
    } catch (error) {
      return false;
    }
  }

  static bool updateHero(Hero hero) {
    try {
      bool flag = deleteHero(hero.id);
      if (flag) {
        flag = createHero(hero);
        return flag;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  static List<Hero> searchHero(String key) {
    return getAllHeroes()
        .where(
            (hero) => hero.name.toLowerCase().startsWith(key.toLowerCase()) || hero.convertOrigin().toLowerCase() == key.toLowerCase())
        .toList();
  }

  static bool deleteHero(int id) {
    try {
      heroes.removeWhere((hero) => hero.id == id);
      return true;
    } catch (error) {
      return false;
    }
  }

  static Hero duplicateHero(Hero hero) {
    Hero newHero = Hero(
        id: getAllHeroes().first.id+1,
        name: "${hero.name} - Duplicate",
        health: hero.health,
        charisma: hero.charisma,
        stamina: hero.stamina,
        origin: hero.origin
    );
    bool flag = createHero(newHero);
    return flag ? newHero : null;
  }
}
