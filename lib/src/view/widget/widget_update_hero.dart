import 'package:flutter/material.dart';
import 'package:hero/src/util/constraints.dart';
import 'package:hero/src/util/helper.dart';
import 'package:hero/src/model/hero.dart' as model;

class UpdateHero extends StatefulWidget {
  final int id;
  final Function() onSuccess;

  UpdateHero({this.id, this.onSuccess});

  @override
  _UpdateHeroState createState() => _UpdateHeroState();
}

class _UpdateHeroState extends State<UpdateHero> {
  TextEditingController nameController = TextEditingController();

  int stamina = 1;
  int health = 1;
  int charisma = 1;
  Origin origin;
  model.Hero hero;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    hero = Helper.getHeroById(widget.id);
    nameController.text = hero.name;
    health = hero.health;
    charisma = hero.charisma;
    stamina = hero.stamina;
    Origin origin = Origin.None;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Update"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: nameController,
            ),
            SizedBox(height: 12),
            Text("Stamina"),
            Text("${stamina.toString()}", textAlign: TextAlign.right),
            Slider(value: stamina.toDouble(), onChanged: (val) {
              if ((val) > 50) {
                setState(() {
                  stamina = val.toInt();
                });
              } else {
                return null;
              }
            },
              max: 100,
              min: 1,
            ),
            SizedBox(height: 12),
            Text("Health"),
            Text("${health.toString()}", textAlign: TextAlign.right),
            Slider(value: health.toDouble(), onChanged: (val) {
              if ((val) > 50) {
                setState(() {
                  stamina = val.toInt();
                });
              } else {
                return null;
              }
            },
              max: 100,
              min: 1,
            ),
            SizedBox(height: 12),
            Text("Charisma"),
            Text("${charisma.toString()}", textAlign: TextAlign.right),
            Slider(value: charisma.toDouble(), onChanged: (val) {
              if ((val) > 50) {
                setState(() {
                  stamina = val.toInt();
                });
              } else {
                return null;
              }
            },
              max: 100,
              min: 1,
            ),
            SizedBox(height: 12),
            DropdownButtonFormField(
              validator: (value) => value==Origin.None ? "* required" : null,
              hint: Text('Please select one'), // Not necessary for Option 1
              value: origin,
              onChanged: (newValue) {
                setState(() {
                  origin = newValue;
                });
              },
              items: ["Please select one", "DC", "Marvel"].map((item) {
                return DropdownMenuItem(
                  child: new Text(item),
                  value: item.toLowerCase() == "please select one" ? Origin.None : item == "DC" ? Origin.DC : Origin.Marvel,
                );
              }).toList(),
            ),
            SizedBox(height: 12),
            RaisedButton(
                onPressed: () {
                  hero.name = nameController.text;
                  hero.stamina = stamina;
                  hero.charisma = charisma;
                  hero.health = health;
                  hero.origin = origin;
                  if (Helper.updateHero(hero)) {
                    widget.onSuccess();
                    Navigator.of(context).pop();
                  } else {
                    print("Update failed");
                  }
            },
                child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
