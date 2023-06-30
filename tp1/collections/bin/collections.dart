import 'package:collections/collections.dart' as collections;
import 'package:collections/collections.dart';

void main(List<String> arguments) {
  
    final List<String> planets = <String>["Terre","Mars","Mercure","Saturne","Vénus","Neptune","Uranus","Jupiter"];
    int num = 0;
    int num2 = 0;
    int num3 = 0;
    int num4 = 0;
    planets.sort();
  print(planets);
  for (var planet in planets) { 
      print(planet.toUpperCase()); 
   } 
  while(num < planets.length) { 
    print(planets[num][0]); 
    num++;
  } 
  do { 
      int index = num2 + 1; 
      String planet = planets[num2];
      print('$index - $planet'); 
      num2++;
   }
   while(num2 < planets.length); 

  do { 
      print((num3 + 1).toString() + " - " + planets[num3]); 
      num3++;
   }
   while(num3 < planets.length); 

   while(num4 < planets.length) {
    final vowels = ['a','e','i','o','u','y'];
     for (var i in vowels){
        if (planets[num4].endsWith(i)){
          print(planets[num4]); 
        }
    } 
    num4++;
  } 
  planets.add("Pluton");
  print(planets);
  Planet mercure = Planet('Mercure', 91.69); 
  Planet saturne = Planet('Saturne', 1275 ); 
  Planet neptune = Planet('Neptune', 4351.40 ); 
  Planet jupiter = Planet('Jupiter', 628.73); 
  Planet mars = Planet('Mars', 78.34); 
  Planet venus = Planet('Venus', 41.40); 
  Planet uranus = Planet('Uranus', 2723.95); 
    final List<Planet> planetList = <Planet>[mercure,saturne,neptune,jupiter,mars,venus,uranus];
    planetList.sort((a, b) => a.distanceFromEarth.compareTo(b.distanceFromEarth));
    for (var planet in planetList){
      print(planet.name);
    }
  Map<String, String> apollo = { 
    "07_1969" : "Apollo 11",
    "11_1969" : "Apollo 12",
    "02_1971" : "Apollo 14",
    "07_1971" : "Apollo 15",
    "04_1972" : "Apollo 16",
    "12_1972" : "Apollo 17",
  }; 
  print(apollo);
  print(apollo['07_1971']);
  print(apollo.keys);
  print(apollo.values);
  apollo['07_1969'] = "Neil Armstrong + Buzz Aldrin";
  print(apollo);
  SolarSystemElement sun = SolarSystemElement('sun', Kind.star); 
  SolarSystemElement earth = SolarSystemElement('earth', Kind.planet); 
  SolarSystemElement moon = SolarSystemElement('moon', Kind.satellite); 
  SolarSystemElement pluton = SolarSystemElement('pluton', Kind.satellite); 
  print(sun.name);
}
