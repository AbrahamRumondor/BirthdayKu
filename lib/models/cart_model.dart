import 'package:birthdayku/models/product_model.dart';

class Cart {
  Cart({
    required this.id,
    required this.title,
  });

  final String id;
  final String title;
  final List<Product> itemID = [];
}
