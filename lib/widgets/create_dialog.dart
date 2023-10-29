import 'package:birthdayku/data/cart_data.dart';
import 'package:birthdayku/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateDialog extends StatefulWidget {
  CreateDialog({
    super.key,
  });

  @override
  State<CreateDialog> createState() => _CreateDialogState();
}

final formatter = DateFormat.yMd();

DateTime? startDate;
DateTime? endDate;

var cartName = '';

class _CreateDialogState extends State<CreateDialog> {
  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();

    void selectDate() async {
      var first = DateTime(2000, 1, 1);
      var last = DateTime(2050, 1, 1);

      final pickedDate = await showDateRangePicker(
          context: context, firstDate: first, lastDate: last);

      setState(() {
        startDate = pickedDate!.start;
        endDate = pickedDate.end;
      });
    }

    void submit() {
      final isValid = form.currentState!.validate();

      if (isValid) {
        form.currentState!.save();

        if (cartData.isEmpty &&
            endDate != null &&
            startDate != null &&
            cartName.isNotEmpty) {
          cartData.add(
            Cart(
                id: 'c1',
                title: cartName,
                endDate: endDate!,
                startDate: startDate!),
          );
          Navigator.pop(context);
        } else if (endDate != null &&
            startDate != null &&
            cartName.isNotEmpty) {
          bool nameExist = false;
          for (var cart in cartData) {
            if (cart.title.compareTo(cartName) == 0) {
              nameExist = true;
            }
          }

          if (!nameExist) {
            var cartId = cartData.length + 1;
            cartData.add(
              Cart(
                  id: 'c$cartId',
                  title: cartName,
                  endDate: endDate!,
                  startDate: startDate!),
            );
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("cart name cannot be same"),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please fill your cart information"),
            ),
          );
          print("hi");
        }
      }
    }

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 320,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: form,
            child: Column(children: [
              const SizedBox(height: 10),
              const Text(
                  style: TextStyle(
                    color: Color.fromRGBO(128, 0, 32, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  'Add New Cart'),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Cart name'),
                keyboardType: TextInputType.name,
                autocorrect: false,
                validator: (value) {
                  if (value == null) {
                    return 'please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  cartName = value!;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Text(
                      startDate != null && endDate != null
                          ? "${formatter.format(startDate!)} - ${formatter.format(endDate!)}"
                          : "Select Date Range",
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 12)),
                  IconButton(
                    onPressed: selectDate,
                    icon: const Icon(Icons.date_range),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
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
                      onPressed: submit,
                      child: const Text('Create'),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
