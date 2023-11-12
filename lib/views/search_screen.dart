import 'package:birthdayku/models/filter_model.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/widgets/product_list_widgets.dart';
import 'package:flutter/material.dart';
import 'package:birthdayku/data/catering_data.dart';
import 'package:birthdayku/data/eo_data.dart';
import 'package:birthdayku/data/venue_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen(
      {super.key, required this.account, required this.category});

  final User account;
  final String category;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Filter filter = Filter(category: 'venue', location: 'All', sort: '0');

  @override
  void initState() {
    filter.category = widget.category;
    // TODO: implement initState
    super.initState();
  }

  bool _filterOn = false;

  String _searchValue = '';

  Widget _tes() {
    if (filter.category == 'venue') {
      print("INI DI VENUE: ${widget.category}");
      return ItemDisplay(
        product: venueData,
        account: widget.account,
        search: _searchValue,
        location: filter.location,
        sort: filter.sort,
      );
    } else if (filter.category == 'eo') {
      return ItemDisplay(
        product: eventOrganizerData,
        account: widget.account,
        search: _searchValue,
        location: filter.location,
        sort: filter.sort,
      );
    } else {
      return ItemDisplay(
        product: cateringData,
        account: widget.account,
        search: _searchValue,
        location: filter.location,
        sort: filter.sort,
      );
    }
  }

  ButtonStyle _changeButtonColor(String check) {
    return (filter.category.compareTo(check) == 0 ||
            filter.location.compareTo(check) == 0 ||
            filter.sort.compareTo(check) == 0)
        ? ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(156, 45, 65, 1),
            foregroundColor: Colors.white,
          )
        : ElevatedButton.styleFrom(backgroundColor: Colors.white);
  }

  ButtonStyle _checkFilterStatus(String check) {
    return (_filterOn)
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

  Widget filterOn() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
            direction: Axis.horizontal, // Default is Axis.horizontal
            alignment: WrapAlignment
                .start, // Start aligns items to the start of each line
            spacing: 8.0, // Spacing between items
            runSpacing: 8.0, // Spacing between lines
            children: [
              ElevatedButton(
                style: _changeButtonColor("All"),
                onPressed: () {
                  setState(() {
                    filter.location = 'All';
                  });
                },
                child: const Text("All"),
              ),
              ElevatedButton(
                style: _changeButtonColor("Tangerang"),
                onPressed: () {
                  setState(() {
                    filter.location = 'Tangerang';
                  });
                },
                child: const Text("Tangerang"),
              ),
              ElevatedButton(
                style: _changeButtonColor("Bandung"),
                onPressed: () {
                  setState(
                    () {
                      filter.location = 'Bandung';
                    },
                  );
                },
                child: const Text("Bandung"),
              ),
              ElevatedButton(
                style: _changeButtonColor("Bali"),
                onPressed: () {
                  setState(
                    () {
                      filter.location = 'Bali';
                    },
                  );
                },
                child: const Text("Bali"),
              ),
              ElevatedButton(
                style: _changeButtonColor("Jakarta"),
                onPressed: () {
                  setState(
                    () {
                      filter.location = 'Jakarta';
                    },
                  );
                },
                child: const Text("Jakarta"),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Urutkan",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
            direction: Axis.horizontal, // Default is Axis.horizontal
            alignment: WrapAlignment
                .start, // Start aligns items to the start of each line
            spacing: 8.0, // Spacing between items
            runSpacing: 8.0, // Spacing between lines
            children: [
              ElevatedButton(
                style: _changeButtonColor("0"),
                onPressed: () {
                  setState(() {
                    filter.sort = '0';
                  });
                },
                child: const Text("Ulasan"),
              ),
              ElevatedButton(
                style: _changeButtonColor("1"),
                onPressed: () {
                  setState(
                    () {
                      filter.sort = '1';
                    },
                  );
                },
                child: const Text("Harga Tertinggi"),
              ),
              ElevatedButton(
                style: _changeButtonColor("-1"),
                onPressed: () {
                  setState(
                    () {
                      filter.sort = '-1';
                    },
                  );
                },
                child: const Text("Harga Terendah"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
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
                    filter.category = 'venue';
                  });
                },
                child: const Text("Venue"),
              ),
              ElevatedButton(
                style: _changeButtonColor("eo"),
                onPressed: () {
                  setState(
                    () {
                      filter.category = 'eo';
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
                      filter.category = 'catering';
                    },
                  );
                },
                child: const Text("Catering"),
              ),
            ],
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       SizedBox(
          //         width: 10,
          //       ),
          //       ElevatedButton(
          //         style: _changeButtonColor("All"),
          //         onPressed: () {
          //           setState(() {
          //             _productLocation = 'All';
          //           });
          //         },
          //         child: const Text("All"),
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       ElevatedButton(
          //         style: _changeButtonColor("Tangerang"),
          //         onPressed: () {
          //           setState(() {
          //             _productLocation = 'Tangerang';
          //           });
          //         },
          //         child: const Text("Tangerang"),
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       ElevatedButton(
          //         style: _changeButtonColor("Bandung"),
          //         onPressed: () {
          //           setState(
          //             () {
          //               _productLocation = 'Bandung';
          //             },
          //           );
          //         },
          //         child: const Text("Bandung"),
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       ElevatedButton(
          //         style: _changeButtonColor("Bali"),
          //         onPressed: () {
          //           setState(
          //             () {
          //               _productLocation = 'Bali';
          //             },
          //           );
          //         },
          //         child: const Text("Bali"),
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       ElevatedButton(
          //         style: _changeButtonColor("Jakarta"),
          //         onPressed: () {
          //           setState(
          //             () {
          //               _productLocation = 'Jakarta';
          //             },
          //           );
          //         },
          //         child: const Text("Jakarta"),
          //       ),
          //       SizedBox(
          //         width: 10,
          //       ),
          //     ],
          //   ),
          // ),
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
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(child: Container()),
              ElevatedButton(
                style: _checkFilterStatus("Filter"),
                onPressed: () {
                  setState(
                    () {
                      _filterOn = _filterOn ? false : true;
                    },
                  );
                },
                child: const Row(
                  children: [
                    Icon(Icons.filter_list_sharp),
                    Text("Filter"),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          _filterOn ? filterOn() : SizedBox(height: 20),

          Expanded(
            child: _tes(),
          ),
        ],
      ),
    );
  }
}
