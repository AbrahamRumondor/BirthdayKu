import 'package:birthdayku/models/product_model.dart';

class Venue extends Product {
  const Venue({
    required String id,
    required String desc,
    required String location,
    required String name,
    required String price,
  }) : super(
          id: id,
          desc: desc,
          location: location,
          name: name,
          price: price,
        );
}
