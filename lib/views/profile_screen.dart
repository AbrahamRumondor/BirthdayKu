import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/views/authentication_screen.dart';
import 'package:birthdayku/views/cart_screen.dart';
import 'package:birthdayku/views/tabs.dart';
import 'package:birthdayku/widgets/create_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.account,
    required this.setLogOut,
  });

  final User account;

  final Function() setLogOut;

  _launchURL(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget displayEventsIcon(String image, String message, BuildContext context) {
    return Container(
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
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(0.0), // Set the circular border radius
          ),
          elevation: 0,
          color: Color.fromRGBO(255, 246, 242, 1),
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 8, top: 8, left: 8, right: 8),
            child: Column(
              children: [
                Image.asset(
                  'assets/img/userImg/$image.png',
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  message,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          if (message.compareTo("Add Event") == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (ctx) => TabsScreen(
                  userID: account.id,
                  activePage: 'Cart Screen',
                  cartState: "cart",
                ),
              ),
            );
            showDialog(
              context: context,
              builder: (ctx) => CreateDialog(),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (ctx) => TabsScreen(
                  userID: account.id,
                  activePage: 'Cart Screen',
                  cartState: "current",
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget optionIcons(String image, String msg, BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/img/userImg/$image.png',
                  width: 30.0,
                  height: 30.0,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(msg),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
            Divider(
              color: Color.fromRGBO(227, 236, 245, 1),
              thickness: 1.5,
            ),
          ],
        ),
      ),
      onTap: () {
        if (msg.compareTo("Booking History") == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => TabsScreen(
                userID: account.id,
                activePage: 'Cart Screen',
                cartState: "history",
              ),
            ),
          );
        } else if (msg.compareTo("Personal Data") == 0) {
        } else if (msg.compareTo("Saran dan Masukan") == 0) {
          // link form
          // _launchURL( DISINI TINGGAL MASUKIN LINK FORM NYA AJA );
        } else {
          // link account wa

          // https://wa.me/6282285107998
          // _launchURL("https://wa.me/6282285107998");

          /* --> ini dah bener dan bisa jalan, tapi klo ga ada inet, dia lost connection.
            trus sekalinya lost connection, device android studio lu kemungkinan bakal error
            (pengalaman gw gini). jadi gw comment aja takut ke klik trus pusing benerinnya,
            cuma intinya dah berhasil.
           */
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 247, 245, 1),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Color.fromRGBO(251, 247, 245, 1),
      ),
      body: Column(
        children: [
          Divider(
            color: Color.fromRGBO(227, 236, 245, 1),
            thickness: 1.5,
          ),
          SizedBox(
            height: 40,
          ),
          IconButton(
            onPressed: () {
              print("image clicked");
            },
            icon: ClipOval(
              child: Image.asset(
                'assets/img/userImg/pp_default.png',
                width: 70.0,
                height: 70.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            account.name,
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              displayEventsIcon("add_event", "Add Event", context),
              displayEventsIcon("my_event", "My Event", context),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          optionIcons("history", "Booking History", context),
          optionIcons("personal_data", "Personal Data", context),
          optionIcons("mail", "Saran dan Masukan", context),
          optionIcons("wa", "Kontak Kami", context),
          Expanded(child: Container()),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/img/userImg/log_out.png',
                        width: 30.0,
                        height: 30.0,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Log Out"),
                      Expanded(child: Container()),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {
              setLogOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AuthenticationScreen(),
                ),
              );
            },
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
