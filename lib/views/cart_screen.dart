import 'package:birthdayku/data/cart_data.dart';
import 'package:birthdayku/models/cart_model.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/widgets/cart_details.dart';
import 'package:birthdayku/widgets/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:birthdayku/widgets/create_dialog.dart';

class CartScreen extends StatefulWidget {
  const CartScreen(
      {super.key,
      required this.myContext,
      required this.account,
      required this.btn});

  final BuildContext myContext;
  final User account;
  final String btn;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String button = "cart";

  @override
  void initState() {
    // TODO: implement initState
    button = widget.btn;
    super.initState();
  }

  ButtonStyle _changeButtonColor(String check) {
    return (button.compareTo(check) == 0)
        ? ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(156, 45, 65, 1),
            foregroundColor: Colors.white,
          )
        : ElevatedButton.styleFrom(backgroundColor: Colors.white);
  }

  void deleteCart(Cart cart) {
    setState(() {
      cartData.remove(cart);
    });
  }

  void refreshCart() {
    setState(() {
      button = button;
    });
  }

  Widget cartItems(Cart cart) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
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
                            width: MediaQuery.of(context).size.width * 0.47,
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  settings:
                                      RouteSettings(name: "/cart_details"),
                                  builder: (context) => CartDetails(
                                    cart: cart,
                                    account: widget.account,
                                    currentPosition: button,
                                    refreshCart: refreshCart,
                                  ),
                                ),
                              );
                            },
                            child: const Text('Detail'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          button.compareTo("cart") == 0
                              ? ElevatedButton(
                                  style: ButtonStyle(
                                    minimumSize:
                                        MaterialStateProperty.all(Size(0, 0)),
                                    maximumSize:
                                        MaterialStateProperty.all(Size(50, 50)),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(8)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            5.0), // Adjust the radius as needed
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => delete_dialog(
                                        cart: cart,
                                        deleteCart: deleteCart,
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.delete_outline),
                                )
                              : SizedBox(),
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
          height: 35,
        ),
      ],
    );
  }

  Widget _chosenButton(BuildContext context) {
    if (button == "cart") {
      return cartData.isNotEmpty
          ? Expanded(
              child: ListView.builder(
                itemCount: cartData.length,
                itemBuilder: (context, index) => cartItems(cartData[index]),
              ),
            )
          : Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You don't have any cart",
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
                ),
              ),
            );
    } else if (button == "current") {
      return currentEventData.isNotEmpty
          ? Expanded(
              child: ListView.builder(
                itemCount: currentEventData.length,
                itemBuilder: (context, index) =>
                    cartItems(currentEventData[index]),
              ),
            )
          : const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You currently don't have any event",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
    } else {
      return transactionHistoryData.isNotEmpty
          ? Expanded(
              child: ListView.builder(
                itemCount: transactionHistoryData.length,
                itemBuilder: (context, index) =>
                    cartItems(transactionHistoryData[index]),
              ),
            )
          : const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You don't have any transaction done",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      button = button;
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(
            style: _changeButtonColor("cart"),
            onPressed: () {
              setState(() {
                button = "cart";
                _changeButtonColor("cart");
              });
            },
            child: Text("Cart"),
          ),
          ElevatedButton(
            style: _changeButtonColor("current"),
            onPressed: () {
              setState(() {
                button = "current";
                _changeButtonColor("current");
              });
            },
            child: Text("Current Events"),
          ),
          ElevatedButton(
            style: _changeButtonColor("history"),
            onPressed: () {
              setState(() {
                button = "history";
                _changeButtonColor("history");
              });
            },
            child: Text("History"),
          ),
        ]),
        SizedBox(
          height: 20,
        ),
        _chosenButton(context),
      ],
    );
  }
}
