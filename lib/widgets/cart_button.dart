import 'package:birthdayku/data/cart_data.dart';
import 'package:birthdayku/models/cart_model.dart';
import 'package:birthdayku/models/product_model.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/widgets/review_dialog.dart';
import 'package:flutter/material.dart';

String getLogo(String id) {
  if (id[0].compareTo('c') == 0) {
    return 'assets/img/cateringImg/catering_logo.png';
  } else if (id[0].compareTo('v') == 0) {
    return 'assets/img/venueImg/venue_logo.png';
  } else {
    return 'assets/img/eoImg/eo_logo.png';
  }
}

Widget _allItems(Product item, BuildContext context, User account,
    Function(Product item) deleteReviewProduct) {
  return Padding(
    padding: const EdgeInsets.only(left: 40, right: 40),
    child: Column(
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
                showDialog(
                  context: context,
                  builder: (ctx) => reviewDialog(
                      account: account,
                      item: item,
                      deleteReview: deleteReviewProduct),
                );
              },
              child: const Text(
                "Review",
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget getBottomStyle(
    Cart cart,
    BuildContext context,
    int totalPrice,
    String currentPosition,
    User account,
    Function(Product item) deleteReviewProduct,
    Function() refreshCart) {
  Cart? reviewCart;
  if (transactionHistoryDataReview.isNotEmpty && currentPosition == "history") {
    reviewCart = transactionHistoryDataReview
        .where((element) => element.id == cart.id)
        .first;
  }

  if (currentPosition == "cart") {
    return Center(
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
            if (totalPrice > 0) {
              currentEventData.add(cart);
              cartData.removeWhere((item) => item.id == cart.id);
              refreshCart();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Your cart has been moved to current events"),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Your cart is empty, please add an item"),
                ),
              );
            }
          },
          child: const Text("Lanjut ke WhatsApp"),
        ),
      ),
    );
  } else if (currentPosition == "current") {
    return Center(
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
            if (totalPrice > 0) {
              transactionHistoryData.add(cart);

              Cart newCart = Cart(
                id: cart.id,
                title: cart.title,
                startDate: cart.startDate,
                endDate: cart.endDate,
              );
              for (Product product in cart.itemID) {
                newCart.itemID.add(product);
              }

              transactionHistoryDataReview.add(newCart);
              currentEventData.remove(cart);
              refreshCart();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Your event has been moved to history"),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  // mungkin grgr harganya jadi 0
                  content: Text("Error"),
                ),
              );
            }
          },
          child: const Text("Selesai"),
        ),
      ),
    );
  } else {
    return Expanded(
      child: ListView.builder(
        itemCount: reviewCart!.itemID.length,
        itemBuilder: (context, index) => _allItems(
            reviewCart!.itemID[index], context, account, deleteReviewProduct),
      ),
    );
  }
}
