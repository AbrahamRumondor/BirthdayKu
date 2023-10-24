import 'package:birthdayku/data/catering_data.dart';
import 'package:birthdayku/widgets/build_card.dart';
import 'package:flutter/material.dart';

class CateringDisplay extends StatelessWidget {
  const CateringDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cateringData.length,
      itemBuilder: (context, index) => BuildCard(item: cateringData[index]),
    );
  }
}
