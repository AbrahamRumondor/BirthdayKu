class Promo {
  Promo({
    required this.activeDate,
    required this.id,
    required this.title,
    required this.value,
    required this.requirement,
  });

  String id;
  final String title;
  final DateTime activeDate;
  final int value;
  final int requirement;
}
