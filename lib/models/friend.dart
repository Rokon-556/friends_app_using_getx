class Friend {
  final String firstName;
  final String lastName;
  final String email;
  final String pictureUrl;
  final String countryName;

 const Friend(this.countryName,
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.pictureUrl});
}
