import 'package:birthdayku/widgets/catering_widgets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.userID});

  final String userID;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _productDisplay = 'venue';

  Widget _tes() {
    if (_productDisplay == 'venue') {
      return const Text("hi");
    } else if (_productDisplay == 'eo') {
      return const Text("hi");
    } else {
      return const CateringDisplay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _productDisplay = 'venue';
                  });
                },
                child: const Text("Venue"),
              ),
              ElevatedButton(
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
            height: 15,
          ),
          Expanded(
            child: _tes(),
          ),
        ],
      ),
    );
  }
}
