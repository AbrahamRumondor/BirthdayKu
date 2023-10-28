import 'package:birthdayku/models/product_model.dart';

class Catering extends Product {
  const Catering({
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
