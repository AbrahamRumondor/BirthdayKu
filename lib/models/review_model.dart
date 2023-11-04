class Review {
  const Review(
      {required this.id,
      required this.userID,
      required this.itemID,
      required this.content,
      required this.value});

  final String id;
  final String userID;
  final String itemID;
  final String content;
  final double value;
}
