import 'package:birthdayku/data/review_data.dart';
import 'package:birthdayku/data/user_data.dart';
import 'package:birthdayku/models/product_model.dart';
import 'package:birthdayku/models/review_model.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key, required this.account, required this.item});

  final User account;
  final Product item;

  List<Review> _getValidReview() {
    List<Review> reviewList = [];
    for (Review review in allReview) {
      if (review.itemID.compareTo(item.id) == 0) {
        reviewList.add(review);
      }
    }

    return reviewList;
  }

  String _getUserName(Review review) {
    for (User user in allUser) {
      if (user.id.compareTo(review.userID) == 0) {
        return user.name;
      }
    }
    return "Anonymous";
  }

  Widget reviewItems(Review review) {
    return Card(
      margin: EdgeInsets.only(bottom: 10, top: 10, left: 0, right: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(color: Colors.black12),
      ),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.account_circle_outlined),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  _getUserName(review),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            RatingBar.builder(
                ignoreGestures: true,
                initialRating: review.value,
                minRating: 1,
                maxRating: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4),
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => Icon(Icons.star),
                onRatingUpdate: (rating) {
                  print(rating);
                })
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Reviews"),
      ),
      body: Column(
        children: [
          const Divider(
            color: Color.fromRGBO(227, 236, 245, 1),
            thickness: 1.5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _getValidReview().length,
              itemBuilder: (context, index) =>
                  reviewItems(_getValidReview()[index]),
            ),
          ),
        ],
      ),
    );
  }
}
