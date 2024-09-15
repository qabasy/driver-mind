// // ignore_for_file: prefer_const_constructors

// import 'package:app/src/blocs/transactions_screen.dart/logic.dart';
// import 'package:app/src/blocs/transactions_screen.dart/state.dart';
// import 'package:app/src/config/constants.dart';
// import 'package:app/src/models/receive_transaction_model.dart';
// import 'package:app/src/models/send_transaction_model.dart';
// import 'package:app/src/screens/transaction_pop.dart';
// import 'package:app/src/utils/show_custom_dialog.dart';
// import 'package:app/src/widgets/payments/total_widget.dart';
// import 'package:app/src/widgets/tabs/rounded_tab.dart';
// import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class TransactionsScreen extends StatelessWidget {
//   final TextEditingController notesController = TextEditingController();
//   final TextEditingController moneyController = TextEditingController();
//   final TextEditingController customerNameController = TextEditingController();

//   TransactionsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TransactionsScreenLogic()
//         ..getTotalPaid()
//         ..getTotalReceived()
//         ..getReceiveTransactions()
//         ..getSendTransactions(),
//       child: BlocConsumer<TransactionsScreenLogic, TransactionsScreenState>(
//         listener: (c, s) {
//           print("State: $s");
//         },
//         builder: (context, state) {
//           TransactionsScreenLogic obj = BlocProvider.of(context);
//           return Scaffold(
//             appBar: AppBar(
//               leading: Icon(Icons.import_export_rounded),
//               title: Text("Transactions"),
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: Column(
//                   children: [
//                     TotalWidget(
//                       totalData: TotalData(
//                         paid: obj.totalPaid,
//                         received: obj.totalReceived,
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Expanded(
//                       child: SizedBox(
//                         width: 360,
//                         child: Card(
//                           shape: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: const Color.fromARGB(255, 218, 213, 213),
//                               width: 2,
//                             ),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                           ),
//                           borderOnForeground: true,
//                           elevation: 10,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 SizedBox(height: 15),
//                                 RoundedTab(),
//                                 SizedBox(height: 10),
//                                 for (int index = 0;
//                                     index < obj.sendTransactions.length;
//                                     index++)
//                                   ListTile(
//                                     shape: OutlineInputBorder(
//                                         // borderRadius: Border
//                                         borderSide: BorderSide(
//                                             // color: Colors
//                                             width: 1.5)),
//                                     onTap: () {},
//                                     titleAlignment:
//                                         ListTileTitleAlignment.center,
//                                     title: SizedBox(
//                                       width: 100,
//                                       child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           obj.sendTransactions[index]
//                                               .customerName,
//                                           overflow: TextOverflow.fade,
//                                         ),
//                                       ),
//                                     ),
//                                     subtitle: SizedBox(
//                                       width: 100,
//                                       child: Text(
//                                         obj.sendTransactions[index].notes ??
//                                             " ",
//                                         overflow: TextOverflow.fade,
//                                       ),
//                                     ),
//                                     trailing: SizedBox(
//                                       width: 80,
//                                       // height: ,
//                                       child: Align(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           Constants.currency.format(
//                                             obj.sendTransactions[index].amount,
//                                           ),
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             bottomNavigationBar: AnimatedBottomNavigationBar(
//               barColor: Colors.white,
//               controller: FloatingBottomBarController(
//                 initialIndex: 1,
//               ),
//               bottomBar: const [],
//               bottomBarCenterModel: BottomBarCenterModel(
//                 centerBackgroundColor: Theme.of(context).primaryColor,
//                 centerIcon: const FloatingCenterButton(
//                   child: Icon(
//                     Icons.add,
//                     color: AppColors.white,
//                   ),
//                 ),
//                 centerIconChild: [
//                   FloatingCenterButtonChild(
//                     child: Icon(
//                       Icons.call_made_rounded,
//                       color: AppColors.white,
//                     ),
//                     onTap: () {
//                       showCustomDialog(
//                         context,
//                         title: "Send Money",
//                         content: TransactionPop(
//                           transactionType: TransactionType.send,
//                           model: SendTransactionModel.empty(),
//                         ),
//                       );
//                     },
//                   ),
//                   FloatingCenterButtonChild(
//                     child: Icon(
//                       Icons.call_received_rounded,
//                       color: AppColors.white,
//                     ),
//                     onTap: () {
//                       showCustomDialog(
//                         context,
//                         title: ("Receive Money"),
//                         content: TransactionPop(
//                           transactionType: TransactionType.receive,
//                           model: ReceiveTransactionModel.empty(),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
