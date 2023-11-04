import 'package:birthdayku/data/review_data.dart';
import 'package:birthdayku/models/product_model.dart';
import 'package:birthdayku/models/review_model.dart';

List<Review> getValidReview(Product item) {
  List<Review> reviewList = [];
  for (Review review in allReview) {
    if (review.itemID.compareTo(item.id) == 0) {
      reviewList.add(review);
    }
  }

  return reviewList;
}

String countReviewRating(List<Review> reviewList) {
  double rating = 0;
  for (Review r in reviewList) {
    rating += r.value;
  }

  return reviewList.isNotEmpty
      ? (rating / reviewList.length).toStringAsFixed(1)
      : "0";
}
