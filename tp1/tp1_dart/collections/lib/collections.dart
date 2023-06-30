int calculate() {
  return 6 * 7;
}
class Planet {
  String name = ""; 
  double distanceFromEarth = 0.0; 
    Planet(String name, double distanceFromEarth){
      
    this.name = name;
    this.distanceFromEarth = distanceFromEarth;  
  }
}
enum Kind {
  planet,
  star,
  satellite,
  asteroid,
  comet}

class SolarSystemElement{
  String name = ""; 
  Kind? kind; 
  SolarSystemElement(String name, Kind kind){
    
  this.name = name;
  this.kind = kind;  
  }
}