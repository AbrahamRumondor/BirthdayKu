import 'package:birthdayku/models/product_model.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/widgets/build_card.dart';
import 'package:flutter/material.dart';

class ItemDisplay extends StatelessWidget {
  ItemDisplay(
      {super.key,
      required this.product,
      required this.account,
      required this.search,
      required this.location});

  final List<Product> product;
  final User account;
  final String search;
  final String location;

  final List<Product> updatedProduct = [];

  void updateProduct() {
    for (Product p in product) {
      if (location.compareTo("All") == 0) {
        if (search.isEmpty) {
          updatedProduct.add(p);
        } else if (search.isNotEmpty &&
            p.name.toLowerCase().contains(search.toLowerCase())) {
          updatedProduct.add(p);
        }
      } else if (p.location.compareTo(location) == 0) {
        if (search.isEmpty) {
          updatedProduct.add(p);
        } else if (search.isNotEmpty &&
            p.name.toLowerCase().contains(search.toLowerCase())) {
          updatedProduct.add(p);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    updateProduct();
    return ListView.builder(
      itemCount: updatedProduct.length,
      itemBuilder: (context, index) => BuildCard(
        myContext: context,
        item: updatedProduct[index],
        account: account,
      ),
    );
  }
}
