import 'package:birthdayku/models/promo_model.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/widgets/promo_list.dart';
import 'package:flutter/material.dart';
import 'package:birthdayku/data/user_data.dart';

Widget rowItem({required String asset, required String text}) {
  return Row(
    children: [
      Image.asset(
        asset,
        width: 50,
      ),
      const SizedBox(
        width: 15,
      ),
      Expanded(
        child: Text(
          text,
          textAlign: TextAlign.justify,
        ),
      )
    ],
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userID});

  final String userID;

  User getUser() {
    for (User user in allUser) {
      if (user.id.compareTo(userID) == 0) {
        return user;
      }
    }
    return User(id: 'p?', name: "?", email: "?", password: "?");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Our Last Event",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Our Service",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    // Define the action to perform when the icon is tapped.
                    () {};
                  },
                  child: Image.asset(
                    'assets/img/catering.png',
                    width: 55,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Define the action to perform when the icon is tapped.
                    () {};
                  },
                  child: Image.asset(
                    'assets/img/concept.png',
                    width: 55,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Define the action to perform when the icon is tapped.
                    () {};
                  },
                  child: Image.asset(
                    'assets/img/venue.png',
                    width: 55,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "My Coupon",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: getUser().promos.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    promoItems(getUser().promos[index], context),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 20,
                top: 20,
                left: 20,
                right: 125,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 202, 183, 1),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: const Text(
                "Why Us?",
                style: TextStyle(
                  color: Color.fromRGBO(156, 45, 65, 1),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  rowItem(
                    asset: 'assets/img/idea.png',
                    text:
                        "Freedom for users to choose their own interests, consultation is not our main value, but only as an additional feature.",
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  rowItem(
                    asset: 'assets/img/flexibility.png',
                    text: "All activities can be done on our platform",
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  rowItem(
                    asset: 'assets/img/target.png',
                    text:
                        "Our business focuses on birthday/celebration planning.",
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  rowItem(
                    asset: 'assets/img/scale.png',
                    text:
                        "We are not limited to our own team members, but we also provide EO, catering, building from outside. In this way, user options become wider and more flexible.",
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    "BirthdayKu",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(156, 45, 65, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Image.asset(
                    'assets/img/regisUser.png',
                    width: 80,
                  ),
                  const Text(
                    "6.000.000+",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(156, 45, 65, 1),
                    ),
                  ),
                  const Text(
                    "Registered Users",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Image.asset(
                    'assets/img/event.png',
                    width: 80,
                  ),
                  const Text(
                    "400.000+",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(156, 45, 65, 1),
                    ),
                  ),
                  const Text(
                    "Events",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
