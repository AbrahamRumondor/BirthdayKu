import 'package:birthdayku/controller/review_tools.dart';
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
      required this.location,
      required this.sort});

  final List<Product> product;
  final User account;
  final String search;
  final String location;
  final String sort;

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

  void sortOption(String sort) {
    if (sort.compareTo("1") == 0) {
      updatedProduct.sort((a, b) => int.parse(b.price) - int.parse(a.price));
    } else if (sort.compareTo("-1") == 0) {
      updatedProduct.sort((a, b) => int.parse(a.price) - int.parse(b.price));
    } else {
      updatedProduct.sort((a, b) =>
          (double.parse(countReviewRating(getValidReview(b)))
              .compareTo(double.parse(countReviewRating(getValidReview(a))))));
      updatedProduct.sort((a, b) => reviewValue(b) - reviewValue(a));
    }
  }

  int reviewValue(Product item) {
    return getValidReview(item).length;
  }

  @override
  Widget build(BuildContext context) {
    updateProduct();
    updatedProduct.sort((a, b) => reviewValue(b) - reviewValue(a));
    sortOption(sort);

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
