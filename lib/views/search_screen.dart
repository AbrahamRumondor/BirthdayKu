import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/widgets/product_list_widgets.dart';
import 'package:flutter/material.dart';
import 'package:birthdayku/data/catering_data.dart';
import 'package:birthdayku/data/eo_data.dart';
import 'package:birthdayku/data/venue_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.account});

  final User account;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _productDisplay = 'venue';

  Widget _tes() {
    if (_productDisplay == 'venue') {
      return ItemDisplay(
        product: venueData,
        account: widget.account,
      );
    } else if (_productDisplay == 'eo') {
      return ItemDisplay(
        product: eventOrganizerData,
        account: widget.account,
      );
    } else {
      return ItemDisplay(
        product: cateringData,
        account: widget.account,
      );
    }
  }

  ButtonStyle _changeButtonColor(String check) {
    return _productDisplay.compareTo(check) == 0
        ? ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(156, 45, 65, 1),
            foregroundColor: Colors.white,
          )
        : ElevatedButton.styleFrom(backgroundColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: _changeButtonColor("venue"),
                onPressed: () {
                  setState(() {
                    _productDisplay = 'venue';
                  });
                },
                child: const Text("Venue"),
              ),
              ElevatedButton(
                style: _changeButtonColor("eo"),
                onPressed: () {
                  setState(
                    () {
                      _productDisplay = 'eo';
                    },
                  );
                },
                child: const Text("Event Organizer"),
              ),
              ElevatedButton(
                style: _changeButtonColor("catering"),
                onPressed: () {
                  setState(
                    () {
                      _productDisplay = 'catering';
                    },
                  );
                },
                child: const Text("Catering"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: _tes(),
          ),
        ],
      ),
    );
  }
}
