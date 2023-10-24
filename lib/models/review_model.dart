class Review {
  const Review({
    required this.id,
    required this.userID,
    required this.itemID,
    required this.content,
  });

  final String id;
  final String userID;
  final String itemID;
  final String content;
}
