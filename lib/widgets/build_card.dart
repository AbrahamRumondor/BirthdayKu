import 'package:birthdayku/models/product_model.dart';
import 'package:birthdayku/widgets/choose_cart.dart';
import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({super.key, required this.item, required this.myContext});

  final BuildContext myContext;

  final Product item;

  void _openItemDetail() {
    showModalBottomSheet(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(100, 300),
          topRight: Radius.elliptical(300, 100),
        ),
      ),
      isScrollControlled: true,
      context: myContext,
      builder: (ctx) => Container(
        height: MediaQuery.of(myContext).size.height * 0.7,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 40,
            bottom: 60,
            right: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/img/closeBottomSheet.png',
                  width: 30,
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              Text(
                item.name,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(156, 45, 65, 1)),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                "Rp ${item.price}000",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(202, 133, 124, 1)),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 20),
                  Text(
                    item.location,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // vertical divider
              const Divider(
                color: Color.fromRGBO(227, 236, 245, 1),
                thickness: 1.5,
              ),

              const SizedBox(
                height: 10,
              ),
              Text(
                item.desc,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: item.features.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Image.asset(
                        'assets/img/nike.png',
                        width: 25,
                      ),
                      const SizedBox(
                        width: 5,
                        height: 30,
                      ),
                      Text(item.features[index]),
                    ],
                  ),
                ),
              ),

              Center(
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
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
                      showDialog(
                        context: myContext,
                        builder: (ctx) => ChooseCart(prod: item),
                      );
                    },
                    child: Text("Pilih"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _openItemDetail,
          child: Container(
            margin: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: const Offset(0, 4),
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
                    width: MediaQuery.of(context).size.height * 0.18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.003),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: Text(
                              item.desc,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              Image.asset(
                                "assets/img/rate.png",
                                width: 15,
                              ),
                              const Text(
                                "4,9 ",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              const Text(
                                " (47 reviews)",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ],
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
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
