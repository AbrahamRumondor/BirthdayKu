import 'package:birthdayku/models/promo_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('d MMMM y', 'en_US');

Widget promoItems(Promo promo, BuildContext context) {
  return SizedBox(
    width: 250,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: Colors.black),
      ),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              promo.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Rp${promo.value.toString()}",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(202, 133, 124, 1),
              ),
            ),
            Text(
              "Aktif s.d. ${formatter.format(promo.activeDate)}",
              style: const TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(107, 143, 188, 1),
              ),
            ),
            Expanded(child: Container()),
            Text(
              "* Promo berlaku untuk pembayaran minimal Rp${promo.value.toString()} *",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
