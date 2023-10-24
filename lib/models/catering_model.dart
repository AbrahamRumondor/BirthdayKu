import 'package:birthdayku/models/product_model.dart';

class Catering extends Product {
  const Catering({
    required String id,
    required String desc,
    required String location,
    required String name,
    required String price,
    required String image,
  }) : super(
          id: id,
          desc: desc,
          location: location,
          name: name,
          price: price,
          image: image,
        );
}
