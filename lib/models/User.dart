class User {
  String name;
  String email;
  String type;
  List favourites;
  List ordersIfAdmin;
  String imageUrl;
  User(
      {required this.name,
      required this.email,
      required this.type,
      required this.favourites,
      required this.ordersIfAdmin,
      required this.imageUrl});
}
