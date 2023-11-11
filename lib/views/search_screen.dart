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
  String _productLocation = 'Tangerang';

  String _searchValue = '';

  Widget _tes() {
    if (_productDisplay == 'venue') {
      print("INI DI VENUE: $_searchValue");
      return ItemDisplay(
        product: venueData,
        account: widget.account,
        search: _searchValue,
        location: _productLocation,
      );
    } else if (_productDisplay == 'eo') {
      return ItemDisplay(
        product: eventOrganizerData,
        account: widget.account,
        search: _searchValue,
        location: _productLocation,
      );
    } else {
      return ItemDisplay(
        product: cateringData,
        account: widget.account,
        search: _searchValue,
        location: _productLocation,
      );
    }
  }

  ButtonStyle _changeButtonColor(String check) {
    return (_productDisplay.compareTo(check) == 0 ||
            _productLocation.compareTo(check) == 0)
        ? ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(156, 45, 65, 1),
            foregroundColor: Colors.white,
          )
        : ElevatedButton.styleFrom(backgroundColor: Colors.white);
  }

  ButtonStyle _ButtonColor(int check) {
    return check == 0
        ? ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(156, 45, 65, 1),
            foregroundColor: Colors.white,
          )
        : ElevatedButton.styleFrom(backgroundColor: Colors.white);
  }

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: _changeButtonColor("All"),
                  onPressed: () {
                    setState(() {
                      _productLocation = 'All';
                    });
                  },
                  child: const Text("All"),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: _changeButtonColor("Tangerang"),
                  onPressed: () {
                    setState(() {
                      _productLocation = 'Tangerang';
                    });
                  },
                  child: const Text("Tangerang"),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: _changeButtonColor("Bandung"),
                  onPressed: () {
                    setState(
                      () {
                        _productLocation = 'Bandung';
                      },
                    );
                  },
                  child: const Text("Bandung"),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: _changeButtonColor("Bali"),
                  onPressed: () {
                    setState(
                      () {
                        _productLocation = 'Bali';
                      },
                    );
                  },
                  child: const Text("Bali"),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: _changeButtonColor("Jakarta"),
                  onPressed: () {
                    setState(
                      () {
                        _productLocation = 'Jakarta';
                      },
                    );
                  },
                  child: const Text("Jakarta"),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _form,
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            labelText: 'Search',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null) {
                              return 'please enter a valid email address';
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            if (_form.currentState!.validate()) {
                              _form.currentState!.save();
                              _searchValue = value;
                              print(_searchValue);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
