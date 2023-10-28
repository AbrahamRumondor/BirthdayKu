import 'package:birthdayku/models/product_model.dart';
import 'package:birthdayku/widgets/build_card.dart';
import 'package:flutter/material.dart';

class ItemDisplay extends StatelessWidget {
  const ItemDisplay({super.key, required this.product});

  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: product.length,
      itemBuilder: (context, index) =>
          BuildCard(myContext: context, item: product[index]),
    );
  }
}
