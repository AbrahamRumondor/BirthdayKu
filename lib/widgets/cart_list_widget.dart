// import 'package:birthdayku/data/cart_data.dart';
// import 'package:birthdayku/models/cart_model.dart';
// import 'package:flutter/material.dart';

// class CartDisplay extends StatelessWidget {
//   const CartDisplay({super.key, required this.cart});

//   final Cart cart;

//   Widget cartItems() {
//     return Row(
//       children: [
//         Column(
//           children: [
//             Text(cart.title),
//             Text(cart.id),
//           ],
//         ),
//         Expanded(child: Container()),
//         ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: const MaterialStatePropertyAll<Color>(
//               Color.fromRGBO(156, 45, 65, 1),
//             ),
//             foregroundColor: const MaterialStatePropertyAll<Color>(
//               Colors.white,
//             ),
//             shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//           onPressed: () {},
//           child: const Text('Create'),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: cartData.length,
//       itemBuilder: (context, index) => cartItems(),
//     );
//   }
// }
