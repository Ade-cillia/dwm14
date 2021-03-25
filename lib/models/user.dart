class UserProfile {
  final String email, name, firstname, city;

  UserProfile({this.email, this.name, this.firstname, this.city});

  fromJson(json) {
    return UserProfile(
      email: json['email'],
      name: json['name'],
      firstname: json['firstname'],
      city: json['city'],
    );
  }
}
