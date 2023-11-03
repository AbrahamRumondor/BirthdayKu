import 'package:birthdayku/models/cart_model.dart';
import 'package:birthdayku/models/product_model.dart';
import 'package:birthdayku/models/promo_model.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/models/venue_model.dart';
import 'package:birthdayku/widgets/choose_promo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartDetails extends StatefulWidget {
  CartDetails({super.key, required this.cart, required this.account});

  final Cart cart;
  final User account;

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  final formatter = DateFormat("EEEEEEEEEE, MMM d, yyyy");

  Product getVenue() {
    for (Product p in widget.cart.itemID) {
      if (p is Venue) {
        return p;
      }
    }
    return widget.cart.itemID[0];
  }

  String getLogo(String id) {
    if (id[0].compareTo('c') == 0) {
      return 'assets/img/cateringImg/catering_logo.png';
    } else if (id[0].compareTo('v') == 0) {
      return 'assets/img/venueImg/venue_logo.png';
    } else {
      return 'assets/img/eoImg/eo_logo.png';
    }
  }

  String getTotalPrice() {
    int totalPrice = 0;
    for (Product item in widget.cart.itemID) {
      totalPrice += int.parse(item.price);
    }
    totalPrice *= 1000;
    return totalPrice.toString();
  }

  Widget allItems(Product item) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Image.asset(
              getLogo(item.id),
              width: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(item.name),
            Expanded(child: Container()),
            Text(
              "Rp ${item.price}000",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Promo? promoUsed;

  void _getPromo(Promo promo) {
    setState(() {
      promoUsed = promo;
    });
  }

  Widget _promoStatus() {
    return promoUsed == null
        ? const SizedBox(
            height: 10,
          )
        : Row(
            children: [
              const Icon(Icons.discount),
              const SizedBox(
                width: 17,
              ),
              Text(promoUsed!.title),
              Expanded(child: Container()),
              Text(
                "Rp ${promoUsed!.value.toString()}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          );
  }

  Widget calculateTotalPayment() {
    return promoUsed == null
        ? Text(
            "Rp ${getTotalPrice()}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        : Column(
            children: [
              Text(
                "Rp ${getTotalPrice()}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black38),
              ),
              Text(
                "Rp ${(int.parse(getTotalPrice()) - promoUsed!.value).toString()}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Details"),
      ),
      body: Column(
        children: [
          const Divider(
            color: Color.fromRGBO(227, 236, 245, 1),
            thickness: 1.5,
          ),
          GestureDetector(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => choosePromo(
                      account: widget.account,
                      totalPrice: int.parse(
                        getTotalPrice(),
                      ),
                      promoStatus: _getPromo,
                    ),
                  ),
                );
              },
              child: Container(
                height: 50,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.discount_outlined,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Check promo to get discount",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      Expanded(child: Container()),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black54,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.55,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.cart.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(getVenue().location),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${formatter.format(widget.cart.startDate)} - ${formatter.format(widget.cart.endDate)}",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.cart.itemID.length,
                      itemBuilder: (context, index) => allItems(
                        widget.cart.itemID[index],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0, left: 6),
                      child: _promoStatus(),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Color.fromRGBO(117, 122, 127, 1),
                    thickness: 1.5,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Payment",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Expanded(child: Container()),
                      calculateTotalPayment(),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
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
                onPressed: () {},
                child: const Text("Lanjut ke WhatsApp"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
