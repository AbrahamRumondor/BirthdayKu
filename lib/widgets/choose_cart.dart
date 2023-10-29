import 'package:birthdayku/data/cart_data.dart';
import 'package:birthdayku/models/cart_model.dart';
import 'package:birthdayku/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChooseCart extends StatefulWidget {
  const ChooseCart({
    super.key,
    required this.prod,
  });

  final Product prod;

  @override
  State<ChooseCart> createState() => _ChooseCartState();
}

class _ChooseCartState extends State<ChooseCart> {
  List<bool?> isChecked = List.filled(cartData.length, false);

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();

    Widget allCarts(Cart cart, var index) {
      return CheckboxListTile(
        title: Text(
          cart.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        value: isChecked[index],
        onChanged: (bool? newValue) {
          setState(() {
            isChecked[index] = newValue!;
            print(cart.title);
          });
        },
        activeColor: Colors.orangeAccent,
      );
    }

    void submit(Product p) {
      for (var i = 0; i < isChecked.length; i++) {
        if (isChecked[i] == true) {
          cartData[i].itemID.add(p);
        }
      }
      Navigator.of(context).pop();
    }

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 430,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: form,
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                    style: TextStyle(
                      color: Color.fromRGBO(128, 0, 32, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    'Choose Cart'),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartData.length,
                    itemBuilder: (context, index) =>
                        allCarts(cartData[index], index),
                  ),
                ),
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    submit(widget.prod);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
