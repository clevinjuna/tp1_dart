import 'dart:math';

import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'models/bachelor.dart';
import 'models/bachelor_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BachelorsMaster(),
    );
  }
}

class BachelorsMaster extends StatelessWidget {
  final List<Bachelor> bachelors = generateFakeBachelors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'accueil'),
      ),
      body: ListView.builder(
        itemCount: bachelors.length,
        itemBuilder: (context, index) {
          final bachelor = bachelors[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(bachelor.avatar),
            ),
            title: Text('${bachelor.firstname} ${bachelor.lastname}'),
            subtitle: Text(bachelor.job),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BachelorDetails(bachelor: bachelor),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

Gender getRandomEnumValue() {
  final List<Gender> values = Gender.values;
  final Random random = Random();
  return values[random.nextInt(values.length)];
}

List<Bachelor> generateFakeBachelors() {
  final List<Bachelor> bachelors = [];

  for (int i = 0; i < 15; i++) {
    int randomLastName = Random().nextInt(lastNames.length);
    String lastName = lastNames[randomLastName];
    int randomFemaleFirstName = Random().nextInt(femaleFirstNames.length);
    String femaleFirstName = femaleFirstNames[randomFemaleFirstName];
    int randomMaleFirstName = Random().nextInt(maleFirstNames.length);
    String maleFirstName = maleFirstNames[randomMaleFirstName];
    Faker faker = new Faker();

    Gender gender = getRandomEnumValue();
    String job = faker.job.title().toString();
    print(job);
    String description = faker.lorem.sentence();
    final firstName = gender == Gender.male ? maleFirstName : femaleFirstName;

    String avatar = "";
    int min = 1;
    int max = 16;
    Random rnd = Random();
    int avatarId = min + rnd.nextInt(max - min);
    avatar = gender == Gender.male ? 'images/man-$avatarId.png' : 'images/woman-$avatarId.png';

    final searchFor = gender == Gender.male ? [Gender.female] : [Gender.male];

    final bachelor = Bachelor(
      firstname: firstName,
      lastname: lastName,
      gender: gender,
      avatar: avatar,
      searchFor: searchFor,
      job: job,
      description: description,
    );

    bachelors.add(bachelor);
  }

  return bachelors;
}

final List<String> maleFirstNames = [
  'John',
  'Michael',
  'David',
  'Vincent',
  'Damien',
  'Bastien',
  'Theo',
  'Eliott',
  'Alex',
];

final List<String> femaleFirstNames = [
  'Emma',
  'Olivia',
  'Sophia',
  'Mathilde',
  'Sabrina',
  'Lynne',
  'Aline',
  'Clemence',
  'Anastasia',
];
final List<String> lastNames = [
  'Dupont',
  'Giangreco',
  'Louis',
  'Garner',
  'Muller',
  'Martin',
];