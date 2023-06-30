import 'package:flutter/material.dart';

  void main() {
    runApp(MuseumApp());
  }
class MuseumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      color: Colors.amberAccent,
      supportedLocales: {const Locale('en', ' ')},
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Museum')),
        body: ArtworkState(),
      ),
    );
  }
}
class ArtworkState extends StatefulWidget {
  @override
  Artwork createState() => Artwork();
}


class Artwork extends State<ArtworkState> {
  bool _isFavorite = false;
  bool _showArticle = false;

  Color secondIconColor = Colors.black;
  double opacity = 0.75;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children:[
                GestureDetector(
                  onTap: updateUI,
                  child: Image.asset('images/Mona_Lisa.jpg', width: 400, height: 500),
                ),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: Opacity(
                            opacity: opacity,
                            child: Icon(Icons.favorite,
                                size: 100,
                                color: secondIconColor,
                               )
                        )
                    )
                ),
                Visibility(
                  visible: _showArticle,
                  child: const FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                        "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                        style: TextStyle(
                          fontFamily: 'RobotoMono',
                          color: Colors.red,
                        ),
                      ),
                  ),
                ),
                 
             ]),
             const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                  Text(
                    'Mona Lisa',
                    style: TextStyle(fontFamily: 'merriweather', fontSize: 30, color: Color.fromARGB(255, 117, 57, 1) )
                  ),
                  Text(
                    'Leonardo Da Vinci',
                    style: TextStyle(fontFamily: 'merriweather', fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 117, 57, 1) )),             
                    ],
                  )
                  
                ]),
             ),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Center(
                  child: InkWell(
                  onTap: _setShowArticle,
                  child: const Icon(
                    Icons.article,
                    color: Colors.black,
                  ))),
                Center(
                  child:  IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: secondIconColor,
                  ),
                  onPressed: updateUI,
                ),
                )]
              ),
            
            ]),  
        ));
            

  }
void updateUI() {
    setState(() {
      if (_isFavorite == false){
        opacity = 1;
        secondIconColor = Colors.red;
        const snackBar = SnackBar(
          content: Text('Oeuvre ajoutée à vos favoris'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        secondIconColor = Colors.black;
        opacity = 0.75;
      }
      _isFavorite = !_isFavorite;
    });

}
 void _setShowArticle() {
    setState(() {
      _showArticle = !_showArticle;
    });
  }

          
}