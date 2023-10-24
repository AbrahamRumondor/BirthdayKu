abstract class Product {
  const Product({
    required this.id,
    required this.desc,
    required this.location,
    required this.name,
    required this.price,
    required this.image,
  });

  final String id;
  final String name;
  final String location;
  final String price;
  final String desc;
  final String image;
}
