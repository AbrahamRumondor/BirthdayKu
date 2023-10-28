import 'package:birthdayku/models/product_model.dart';

class Venue extends Product {
  const Venue({
    required String id,
    required String desc,
    required String type,
    required String location,
    required String name,
    required String price,
    required String image,
    required List<String> features,
  }) : super(
          id: id,
          desc: desc,
          type: type,
          location: location,
          name: name,
          price: price,
          image: image,
          features: features,
        );
}
