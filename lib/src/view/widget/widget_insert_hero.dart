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

  int stamina = 1;
  int health = 1;
  int charisma = 1;
  Origin origin;
  model.Hero hero;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("New Hero"),
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
              validator: (val) => val.isEmpty ? "* required" : null,
              controller: nameController,
            ),
            SizedBox(height: 12),
            Text("Stamina"),
            Text("${stamina.toString()}", textAlign: TextAlign.right),
            Slider(
              value: stamina.toDouble(),
              onChanged: (val) {
                if ((val) > 50) {
                  setState(() {
                    stamina = val.toInt();
                  });
                }
              },
              max: 100,
              min: 1,
            ),
            SizedBox(height: 12),
            Text("Health"),
            Text("${health.toString()}", textAlign: TextAlign.right),
            Slider(
              value: health.toDouble(),
              onChanged: (val) {
                if ((val) > 50) {
                  setState(() {
                    health = val.toInt();
                  });
                }
              },
              max: 100,
              min: 1,
            ),
            SizedBox(height: 12),
            Text("Charisma"),
            Text("${charisma.toString()}", textAlign: TextAlign.right),
            Slider(
              value: charisma.toDouble(),
              onChanged: (val) {
                if ((val) > 50) {
                  setState(() {
                    charisma = val.toInt();
                  });
                }
              },
              max: 100,
              min: 1,
            ),
            SizedBox(height: 12),
            DropdownButtonFormField(
              validator: (value) => value == Origin.None ? "* required" : null,
              hint: Text('Please select one'),
              // Not necessary for Option 1
              value: origin,
              onChanged: (newValue) {
                setState(() {
                  origin = newValue;
                });
              },
              items: ["Please select one", "DC", "Marvel"].map((item) {
                return DropdownMenuItem(
                  child: new Text(item),
                  value: item.toLowerCase() == "please select one"
                      ? Origin.None
                      : item == "DC"
                          ? Origin.DC
                          : Origin.Marvel,
                );
              }).toList(),
            ),
            SizedBox(height: 12),
            RaisedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  hero = model.Hero(
                    id: Helper.getAllHeroes().first.id + 1,
                    name: nameController.text,
                    stamina: stamina,
                    health: health,
                    charisma: charisma,
                    origin: origin,
                  );
                  if (Helper.createHero(hero)) {
                    Navigator.of(context).pop();
                    widget.onSuccess();
                  } else {
                    print("Insert failed");
                  }
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
