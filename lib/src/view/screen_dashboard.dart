import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hero/src/view/screen_hero_details.dart';
import 'package:hero/src/util/constraints.dart';
import 'package:hero/src/util/helper.dart';
import 'package:hero/src/model/hero.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<ActionHero> filteredHeroes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.indigo.shade900,
        title: Center(
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.grey.shade300,
              filled: true,
              hintText: "Search",
              isDense: true,
              suffixIcon: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(60),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 24,
                ),
              ),
              contentPadding: EdgeInsets.all(15),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: (text) {
              text = text.toLowerCase();
              print(text);
              setState(
                () {
                  filteredHeroes = Helper.searchHero(text);
                },
              );
            },
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  itemCount: filteredHeroes.isEmpty
                      ? heroes.length
                      : filteredHeroes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75),
                  itemBuilder: (context, index) {
                    return HeroCard(
                      hero: filteredHeroes.isEmpty
                          ? heroes[index]
                          : filteredHeroes[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HeroDetails(
                                    hero: heroes[index],
                                  ),
                          ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.person_add),
        onPressed: () {},
      ),
      backgroundColor: Colors.black54,
    );
  }

  Widget heroCard(Hero hero, BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      ),
    );
  }
}

class HeroCard extends StatelessWidget {
  final ActionHero hero;
  final Function press;

  const HeroCard({
    Key key,
    this.hero,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              hero.image,
              fit: BoxFit.cover,
              height: 175,
              width: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              hero.name,
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          Text(
            "Id : ${hero.id}",
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
