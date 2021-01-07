import 'package:flutter/material.dart';
import 'package:hero/src/util/helper.dart';
import 'package:hero/src/view/widget/widget_update_hero.dart';
import 'package:hero/src/model/hero.dart' as model;

class HeroDetails extends StatefulWidget {
  final int id;
  final Function onRefresh;
  HeroDetails({this.id, this.onRefresh});

  @override
  _HeroDetailsState createState() => _HeroDetailsState();
}

class _HeroDetailsState extends State<HeroDetails> {
  @override
  Widget build(BuildContext context) {
    model.Hero hero = Helper.getHeroById(widget.id);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(hero.name),
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateHero(widget.id, () {
              setState(() {

              });
            })));
          }),
          IconButton(icon: Icon(Icons.copy), onPressed: () {
            if (Helper.duplicateHero(hero) != null) {
              widget.onRefresh();
            }
          }),
          IconButton(icon: Icon(Icons.delete), onPressed: () {
            if (Helper.deleteHero(widget.id)) {
              widget.onRefresh();
              Navigator.of(context).pop();
            } else {
              showDialog(context: context, builder: (context) => AlertDialog(title: Text("Something went wrong!"),));
            }
          }),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Stamina: ${hero.stamina}"),
            SizedBox(height: 16),
            Text("Health: ${hero.health}"),
            SizedBox(height: 16),
            Text("Charisma: ${hero.charisma}")
          ],
        ),
      ),
    );
  }
}
