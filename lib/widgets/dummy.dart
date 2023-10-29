// import 'package:birthdayku/data/cart_data.dart';
// import 'package:birthdayku/models/cart_model.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class CreateDialog extends StatelessWidget {
//   CreateDialog(
//       {super.key,
//       required this.startDate,
//       required this.endDate,
//       required this.onSelectDate});

//   DateTime? startDate;
//   DateTime? endDate;

//   final void Function(DateTime? startDate, DateTime? endDate) onSelectDate;

//   @override
//   Widget build(BuildContext context) {
//     final form = GlobalKey<FormState>();
//     var cartName = '';

//     void selectDate() {
//       var first = DateTime(2000, 1, 1);
//       var last = DateTime(2050, 1, 1);

//       showDateRangePicker(context: context, firstDate: first, lastDate: last)
//           .then((pickedDateRange) {
//         if (pickedDateRange != null) {
//           // User selected a date range
//           startDate = pickedDateRange.start;
//           endDate = pickedDateRange.end;

//           onSelectDate(startDate, endDate);
//         }
//       });
//     }

//     void submit() {
//       final isValid = form.currentState!.validate();

//       if (isValid) {
//         form.currentState!.save();

//         if (cartData.isEmpty) {
//           cartData.add(
//             Cart(id: 'c1', title: cartName),
//           );
//         } else {
//           for (var cart in cartData) {
//             if (!(cart.title.compareTo(cartName) == 0)) {
//               var cartId = cartData.length + 1;
//               cartData.add(
//                 Cart(id: 'c$cartId', title: cartName),
//               );
//             } else {
//               const SnackBar(
//                 content: Text("cart name cannot be same"),
//               );
//             }
//           }
//         }
//       }
//     }

//     return Dialog(
//       elevation: 0,
//       backgroundColor: Colors.white,
//       child: SizedBox(
//         height: 320,
//         child: Padding(
//           padding: const EdgeInsets.all(40.0),
//           child: Form(
//             key: form,
//             child: Column(children: [
//               const SizedBox(height: 10),
//               const Text(
//                   style: TextStyle(
//                     color: Color.fromRGBO(128, 0, 32, 1),
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   'Add New Cart'),
//               const SizedBox(height: 15),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Cart name'),
//                 keyboardType: TextInputType.name,
//                 autocorrect: false,
//                 validator: (value) {
//                   if (value == null) {
//                     return 'please enter a valid email address';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   cartName = value!;
//                 },
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 children: [
//                   Expanded(child: Container()),
//                   Text(
//                       startDate != null && endDate != null
//                           ? "Test"
//                           : "Selected Date",
//                       textAlign: TextAlign.right,
//                       style: const TextStyle(fontSize: 13)),
//                   IconButton(
//                     onPressed: selectDate,
//                     icon: const Icon(Icons.date_range),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: const MaterialStatePropertyAll<Color>(
//                           Color.fromRGBO(156, 45, 65, 1),
//                         ),
//                         foregroundColor: const MaterialStatePropertyAll<Color>(
//                           Colors.white,
//                         ),
//                         shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                       onPressed: submit,
//                       child: const Text('Create'),
//                     ),
//                   ],
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
