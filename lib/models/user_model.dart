import 'package:birthdayku/models/cart_model.dart';
import 'package:birthdayku/models/promo_model.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  final String id;
  final String name;
  final String email;
  final String password;
  final List<Cart> carts = [];
  final List<Promo> promos = [];
}
