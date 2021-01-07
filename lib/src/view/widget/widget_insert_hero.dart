import 'package:flutter/material.dart';
import 'package:hero/src/util/constraints.dart';
import 'package:hero/src/util/helper.dart';
import 'package:hero/src/model/hero.dart' as model;

class InsertHero extends StatefulWidget {
  final Function() onSuccess;

  InsertHero({this.onSuccess});

  @override
  _InsertHeroState createState() => _InsertHeroState();
}

class _InsertHeroState extends State<InsertHero> {
  TextEditingController nameController = TextEditingController();

  int stamina = 0;
  int health = 0;
  int charisma = 0;
  model.Hero hero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("New Hero"),
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameController,
          ),
          SizedBox(height: 12),
          Text("Stamina"),
          Text("${stamina.toString()}"),
          Slider(
            value: stamina.toDouble(),
            onChanged: (val) {
              setState(() {
                stamina = val.toInt();
              });
            },
            max: 100,
            min: 0,
          ),
          SizedBox(height: 12),
          Text("Health"),
          Text("${health.toString()}"),
          Slider(
            value: health.toDouble(),
            onChanged: (val) {
              setState(() {
                health = val.toInt();
              });
            },
            max: 100,
            min: 0,
          ),
          SizedBox(height: 12),
          Text("Charisma"),
          Text("${charisma.toString()}"),
          Slider(
            value: charisma.toDouble(),
            onChanged: (val) {
              setState(() {
                charisma = val.toInt();
              });
            },
            max: 100,
            min: 0,
          ),
          SizedBox(height: 12),
          RaisedButton(
            onPressed: () {
              hero = model.Hero(
                  id: Helper.getAllHeroes().first.id + 1,
                  name: nameController.text,
                  health: health,
                  charisma: charisma,
                  stamina: stamina,
                  origin: Origin.DC
              );
              if (Helper.createHero(hero)) {
                Navigator.of(context).pop();
                widget.onSuccess();
              } else {
                print("Insert failed");
              }
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
