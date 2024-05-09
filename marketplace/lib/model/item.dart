class Item {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final String ratingRate;
  final String ratingCount;

  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingRate,
    required this.ratingCount,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final title = json['title'];
    final price = json['price'];
    final description = json['description'];
    final category = json['category'];
    final image = json['image'];
    final ratingRate = json['rating']['rate'];
    final ratingCount = json['rating']['count'];
    return Item(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      ratingRate: ratingRate,
      ratingCount: ratingCount,
    );
    // final name = '${json['name']['title']} ${json['name']['first']} ${json['name']['last']}';
    // final picture = json['picture']['large'];
    // final location = '${json['location']['city']}, ${json['location']['country']}';
    // final registerDate = json['registered']['date'];
    // return Item(
    //   fullName: name,
    //   picture: picture,
    //   location: location,
    //   registerDate: registerDate,
    // );
  }
}