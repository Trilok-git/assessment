
class Product {
  final int id;
  final String title;
  final String category;
  final num price;
  final String description;
  final String image;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
    required this.rating
  });

  static List<Product> products = [];

}

class Rating{
  final num rate;
  final int count;

  Rating({
    required this.rate,
    required this.count
  });
}