import 'package:birthdayku/data/cart_data.dart';
import 'package:birthdayku/models/cart_model.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/widgets/cart_details.dart';
import 'package:flutter/material.dart';
import 'package:birthdayku/widgets/create_dialog.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.myContext, required this.account});

  final BuildContext myContext;
  final User account;

  Widget cartItems(Cart cart) {
    return Column(
      children: [
        const SizedBox(
          height: 35,
        ),
        Container(
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
              borderRadius:
                  BorderRadius.circular(0.0), // Set the circular border radius
            ),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 2, top: 2, left: 10, right: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(myContext).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cart.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  "${formatter.format(cart.startDate)} - ${formatter.format(cart.endDate)}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                Color.fromRGBO(156, 45, 65, 1),
                              ),
                              foregroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                Colors.white,
                              ),
                              shape: MaterialStatePropertyAll<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(myContext).push(
                                MaterialPageRoute(
                                  settings:
                                      RouteSettings(name: "/cart_details"),
                                  builder: (context) =>
                                      CartDetails(cart: cart, account: account),
                                ),
                              );
                            },
                            child: const Text('Detail'),
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

  @override
  Widget build(BuildContext context) {
    return cartData.isNotEmpty
        ? ListView.builder(
            itemCount: cartData.length,
            itemBuilder: (context, index) => cartItems(cartData[index]),
          )
        : Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "You Don't Have Any Cart",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => CreateDialog(),
                  );
                },
                child: const Text("Create Cart"),
              ),
            ],
          ));
  }
}
