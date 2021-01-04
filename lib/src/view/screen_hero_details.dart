import 'package:flutter/material.dart';
import 'package:hero/update_info.dart';
import 'package:hero/src/model/hero.dart';

class HeroDetails extends StatefulWidget {
  final String heroName;
  final ActionHero hero;

  const HeroDetails({Key key, this.heroName, this.hero}) : super(key: key);
  @override
  _HeroDetailsState createState() => _HeroDetailsState();
}

class _HeroDetailsState extends State<HeroDetails> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text("Hero Details "),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: ListView(
        children: [

          HeroDetailsThumbnail(thumbnail: "${widget.hero.image}"
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*ClipRRect(borderRadius: BorderRadius.circular(42),
                 child: Image.asset(heroes[0].image, fit: BoxFit.cover, height: 150,width: 200,
                  ),
              ),*/
                  Text("Name: ${widget.hero.name}",style: TextStyle(fontSize: 20,color: Colors.blue[900])),
                  Text("Id: ${widget.hero.id}",style: TextStyle(fontSize: 20,color: Colors.blue[900])),
                  Text("Health : ${widget.hero.health}",style: TextStyle(fontSize: 20,color: Colors.blue[900])),
                  Text("Stamina : ${widget.hero.stamina}",style: TextStyle(fontSize: 20,color: Colors.teal)),
                  Text("Charisma : ${widget.hero.charisma}",style: TextStyle(fontSize: 20,color: Colors.teal)),
                  Text("Origin : ${widget.hero.origin}",style: TextStyle(fontSize: 20,color: Colors.pink)),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Center(
                      child: RaisedButton(
                        color: Colors.tealAccent,
                        child:Text("Update",style: TextStyle(fontSize: 20,color: Colors.black)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => UpdateDetails())
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeroDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const HeroDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(thumbnail),
                      fit: BoxFit.cover)
              ),
            ),
            Icon(Icons.play_circle_outline,size: 100,color: Colors.white)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5f5),Colors.blue.shade100],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)
          ),
          height: 80,
        ),
      ],
    );
  }
}

class HeroDetailsHeaderWithPoster extends StatefulWidget {
  final ActionHero hero;

  const HeroDetailsHeaderWithPoster({Key key, this.hero}) : super(key: key);
  @override
  _HeroDetailsHeaderWithPosterState createState() => _HeroDetailsHeaderWithPosterState();
}

class _HeroDetailsHeaderWithPosterState extends State<HeroDetailsHeaderWithPoster> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16)
    );
  }
}