enum Gender {
  male,
  female,
}

class Bachelor {
  final String firstname;
  final String lastname;
  final Gender gender;
  final String avatar;
  final List<Gender> searchFor;
  String job;
  String description;
  bool isLiked;

  Bachelor({
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.avatar,
    required this.searchFor,
    required this.job,
    required this.description,
    this.isLiked = false,
  });
}