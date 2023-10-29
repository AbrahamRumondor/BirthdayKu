import 'package:birthdayku/models/cart_model.dart';
import 'package:birthdayku/models/product_model.dart';
import 'package:birthdayku/models/venue_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartDetails extends StatelessWidget {
  CartDetails({super.key, required this.cart});

  final Cart cart;

  final formatter = DateFormat("EEEEEEEEEE, MMM d, yyyy");

  Product getVenue() {
    for (Product p in cart.itemID) {
      if (p is Venue) {
        return p;
      }
    }
    return cart.itemID[0];
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
    for (Product item in cart.itemID) {
      totalPrice += int.parse(item.price);
    }

    return totalPrice.toString();
  }

  Widget allItems(Product item) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Image.asset(
              getLogo(item.id),
              width: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Text(item.name),
            Expanded(child: Container()),
            Text(
              "Rp ${item.price}000",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CART DETAILS"),
      ),
      body: Column(
        children: [
          const Divider(
            color: Color.fromRGBO(227, 236, 245, 1),
            thickness: 1.5,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              cart.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Payment"),
                  // Text(getVenue().location),
                  Text(
                    "${formatter.format(cart.startDate)} - ${formatter.format(cart.endDate)}",
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.itemID.length,
                      itemBuilder: (context, index) => allItems(
                        cart.itemID[index],
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  const Divider(
                    color: Color.fromRGBO(117, 122, 127, 1),
                    thickness: 1.5,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Total Payment",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "Rp ${getTotalPrice()}000",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
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
