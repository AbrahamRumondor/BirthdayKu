import 'package:birthdayku/models/promo_model.dart';
import 'package:flutter/material.dart';

Future<dynamic> showPromoSheet(
    BuildContext context, Promo promo, Function(Promo) promoStatus) {
  return showModalBottomSheet(
    elevation: 0,
    backgroundColor: Colors.white,
    shape: const ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(),
    ),
    isScrollControlled: true,
    context: context,
    builder: (ctx) => Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("You can save up to"),
                Text(
                  "Rp${promo.value}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll<Color>(
                  Color.fromRGBO(156, 45, 65, 1),
                ),
                foregroundColor: const MaterialStatePropertyAll<Color>(
                  Colors.white,
                ),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              onPressed: () {
                promoStatus(promo);
                Navigator.of(context)
                    .popUntil(ModalRoute.withName('/cart_details'));
              },
              child: const Padding(
                padding: EdgeInsets.all(13.0),
                child: Text(
                  "Use Promo",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
