import 'package:string/string.dart' as string;

void main(List<String> arguments) {
  String message = "Hello, World !";
  String welcome = "Hello, World !";
  String welcomeTwo = welcome.replaceAll(",", "");
  String hello = "Hello";
  String world = "world";
  final Iterable<String> words = List.unmodifiable([welcomeTwo.substring(0,5), welcomeTwo.substring(6,11)]);
  String pwd = "";
  String email = "john@doe.com";

  print('Hello, world: ${string.calculate()}!');
  print(message);
  print('$hello $world !');
  print(hello + world);
  print(message.substring(0, 5));
  print(message.length);
  welcome = welcome.replaceAll("l", "1");
  welcome = welcome.replaceAll("e", "3");
  welcome = welcome.replaceAll("o", "8");
  print(welcome);
  print(welcomeTwo);
  print(words);
  print(pwd.isEmpty?"Mot de passe manquant":"Mot de passe fourni");
  print(email.contains(".")&& email.contains("@")?"email valide":"email non valide");
}
