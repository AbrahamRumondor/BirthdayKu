import 'package:birthdayku/models/product_model.dart';
import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({super.key, required this.item});

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    0.0), // Set the circular border radius
              ),
              elevation: 0,
              color: Colors.white,
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/cateringImg/steak.png',
                    width: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "1234567890ABCDEFG",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: const Text(
                              "fast food",
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04),
                          const SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              "4,9 (47 reviews)",
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
