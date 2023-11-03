import 'package:birthdayku/models/promo_model.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/widgets/promo_bottom_sheet.dart';
import 'package:birthdayku/widgets/promo_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class choosePromo extends StatefulWidget {
  const choosePromo(
      {super.key,
      required this.account,
      required this.totalPrice,
      required this.promoStatus});

  final User account;
  final int totalPrice;
  final Function(Promo) promoStatus;

  @override
  State<choosePromo> createState() => _choosePromoState();
}

class _choosePromoState extends State<choosePromo> {
  final formatter = DateFormat("EEEEEEEEEE, MMM d, yyyy");

  Promo? chosenPromo;

  List<Promo> _getValidPromo() {
    List<Promo> promos = [];
    print(widget.totalPrice);
    for (Promo p in widget.account.promos) {
      if (p.requirement < (widget.totalPrice * 1000)) promos.add(p);
    }
    return promos;
  }

  BorderSide _changeBorderColor(Promo promo) {
    if (chosenPromo != null) if (chosenPromo!.id.compareTo(promo.id) == 0)
      return BorderSide(color: Colors.green);
    else
      return BorderSide(color: Colors.black12);
    else
      return BorderSide(color: Colors.black12);
  }

  Color _changeColor(Promo promo) {
    if (chosenPromo != null) {
      if (chosenPromo!.id.compareTo(promo.id) == 0)
        return Color.fromARGB(129, 201, 255, 205);
      else
        return Colors.white;
    } else
      return Colors.white;
  }

  Widget promoItems(Promo promo) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            chosenPromo = promo;
            showPromoSheet(context, chosenPromo!, widget.promoStatus);
          });
          print(promo.title);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: _changeBorderColor(promo),
          ),
          elevation: 0,
          color: _changeColor(promo),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promo.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Rp${promo.value.toString()}",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(202, 133, 124, 1),
                  ),
                ),
                Text(
                  "Aktif s.d. ${formatter.format(promo.activeDate)}",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(107, 143, 188, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Use Promo"),
      ),
      body: Column(
        children: [
          const Divider(
            color: Color.fromRGBO(227, 236, 245, 1),
            thickness: 1.5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _getValidPromo().length,
              itemBuilder: (context, index) =>
                  promoItems(_getValidPromo()[index]),
            ),
          ),
          Text("data"),
        ],
      ),
    );
  }
}
