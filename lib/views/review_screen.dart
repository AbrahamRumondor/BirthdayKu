import 'package:birthdayku/data/review_data.dart';
import 'package:birthdayku/data/user_data.dart';
import 'package:birthdayku/models/product_model.dart';
import 'package:birthdayku/models/review_model.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:birthdayku/controller/review_tools.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key, required this.account, required this.item});

  final User account;
  final Product item;

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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            RatingBar.builder(
              itemSize: 20,
              ignoreGestures: true,
              initialRating: review.value,
              minRating: 1,
              maxRating: 5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) =>
                  Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(review.content),
            SizedBox(
              height: 10,
            ),
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
              itemCount: getValidReview(item).length,
              itemBuilder: (context, index) =>
                  reviewItems(getValidReview(item)[index]),
            ),
          ),
        ],
      ),
    );
  }
}
