// import 'package:birthdayku/models/product_model.dart';

import 'package:birthdayku/models/product_model.dart';

class Cart {
  Cart(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.endDate});

  final String id;
  final String title;
  final List<Product> itemID = [];
  final DateTime startDate;
  final DateTime endDate;
}
