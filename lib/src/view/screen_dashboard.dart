import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hero/src/view/screen_hero_details.dart';
import 'package:hero/src/util/helper.dart';
import 'package:hero/src/model/hero.dart' as model;
import 'package:hero/src/view/widget/widget_insert_hero.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<model.Hero> heroList = [];

  @override
  void initState() {
    heroList = Helper.getAllHeroes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => InsertHero(
                onSuccess: () {
                  setState(() {
                    heroList = Helper.getAllHeroes();
                  });
                },
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: 54,
              child: TextField(
                onChanged: (key) {
                  setState(() {
                    if (key.isNotEmpty) {
                      heroList = Helper.searchHero(key);
                    } else {
                      heroList = Helper.getAllHeroes();
                    }
                  });
                },
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Search",
                    border: InputBorder.none),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  model.Hero hero = heroList[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HeroDetails(
                            id: hero.id, onRefresh: () {
                              setState(() {
                                heroList = Helper.getAllHeroes();
                              });
                            },
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: Text(
                        hero.convertOrigin(),
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                    title: Text(hero.name),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.battery_charging_full),
                                SizedBox(width: 4),
                                Text("${hero.stamina}"),
                              ],
                            ),
                            SizedBox(width: 24),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.medical_services_outlined),
                                SizedBox(width: 4),
                                Text("${hero.health}"),
                              ],
                            ),
                            SizedBox(width: 24),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.person),
                                SizedBox(width: 4),
                                Text("${hero.charisma}")
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: heroList.length,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
