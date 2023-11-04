import 'package:birthdayku/data/cart_data.dart';
import 'package:birthdayku/data/review_data.dart';
import 'package:birthdayku/models/cart_model.dart';
import 'package:birthdayku/models/product_model.dart';
import 'package:birthdayku/models/review_model.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class reviewDialog extends StatefulWidget {
  reviewDialog({
    super.key,
    required this.account,
    required this.item,
    required this.deleteReview,
  });

  final User account;
  final Product item;
  final Function(Product) deleteReview;

  @override
  State<reviewDialog> createState() => _reviewDialogState();
}

final formatter = DateFormat.yMd();

var ratingValue;
var reviewDesc;

class _reviewDialogState extends State<reviewDialog> {
  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();

    String _getID() {
      return 'r' + (allReview.length + 1).toString();
    }

    void _submit() {
      final isValid = form.currentState!.validate();

      if (isValid) {
        form.currentState!.save();

        allReview.add(
          Review(
              id: _getID(),
              userID: widget.account.id,
              itemID: widget.item.id,
              content: reviewDesc,
              value: ratingValue),
        );
        widget.deleteReview(widget.item);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Your review has been added successfully"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please fill the review"),
          ),
        );
      }
    }

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 430,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Form(
              key: form,
              child: Column(children: [
                const SizedBox(height: 10),
                const Text(
                    style: TextStyle(
                      color: Color.fromRGBO(128, 0, 32, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    'Review'),
                Text(
                    style: const TextStyle(
                      color: Color.fromRGBO(128, 0, 32, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    widget.item.name),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Write your review',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  minLines: 5,
                  maxLines: null,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null) {
                      return 'please write your review description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    reviewDesc = value!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                RatingBar.builder(
                  itemSize: 35,
                  initialRating: 0,
                  minRating: 1,
                  maxRating: 5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    ratingValue = rating;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                            Color.fromRGBO(156, 45, 65, 1),
                          ),
                          foregroundColor:
                              const MaterialStatePropertyAll<Color>(
                            Colors.white,
                          ),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: _submit,
                        child: const Text('Create'),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
