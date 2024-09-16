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




/*
// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:app/src/blocs/trading_screen.dart/logic.dart';
import 'package:app/src/blocs/trading_screen.dart/state.dart';
import 'package:app/src/config/constants.dart';
import 'package:app/src/models/purchase_model.dart';
import 'package:app/src/models/sale_model.dart';
import 'package:app/src/screens/trading_pop.dart';
import 'package:app/src/screens/transaction_pop.dart';
import 'package:app/src/utils/show_custom_dialog.dart';
import 'package:app/src/widgets/payments/total_widget.dart';
import 'package:app/src/widgets/return_widget.dart';
import 'package:app/src/widgets/tabs/rounded_tab.dart';
import 'package:app/src/widgets/totals_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class TradingScreen extends StatelessWidget {
  final TextEditingController notesController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController customerNameController = TextEditingController();

  TradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TradingScreenLogic()..getPurchases(),
      child: BlocConsumer<TradingScreenLogic, TradingScreenState>(
        listener: (context, state) {
          if (kDebugMode) {
            print("State: $state");
          }
        },
        builder: (context, state) {
          TradingScreenLogic obj = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Trading"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Purchases",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              CircleAvatar(
                                child: Text(
                                  "${obj.purchases.length}",
                                  // style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int index = 0;
                                    index < obj.purchases.length;
                                    index++)
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: ListTile(
                                      tileColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      style: ListTileStyle.list,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      titleAlignment:
                                          ListTileTitleAlignment.center,
                                      onTap: () {},
                                      title: Text(
                                        obj.purchases[index].customerName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      subtitle: SizedBox(
                                        width: 300,
                                        child: Text(
                                          "${Constants.number.format(obj.purchases[index].amount)} x ${Constants.number.format(obj.purchases[index].price)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                      trailing: SizedBox(
                                        width: 100,
                                        child: Text(
                                          Constants.currency.format(
                                            obj.purchases[index].total,
                                          ),
                                          textAlign: TextAlign.right,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: SpeedDial(
              // spaceBetweenChildren: 5,
              curve: Curves.bounceInOut,
              child: Icon(Icons.add_business_sharp),
              // activeChild: ,
              children: [
                SpeedDialChild(
                  child: Icon(Icons.add_shopping_cart_rounded),
                  elevation: 10,
                  label: "Buy",
                  onTap: () {
                    showCustomDialog(
                      context,
                      content: TradingPop(
                        model: PurchaseModel(
                          id: null,
                          amount: 0,
                          total: 0,
                          price: 0,
                          customerName: "",
                          createDate: DateTime.now().toLocal(),
                        ),
                        transactionType: TransactionType.buy,
                      ),
                    );
                  },
                ),
                SpeedDialChild(
                  child: Icon(Icons.sell_rounded),
                  elevation: 10,
                  label: "Sell",
                  onTap: () {
                    showCustomDialog(
                      onDeletePressed: () {},
                      context,
                      content: TradingPop(
                        model: SaleModel(
                          id: null,
                          amount: 0,
                          total: 0,
                          price: 0,
                          customerName: "",
                          createDate: DateTime.now(),
                        ),
                        transactionType: TransactionType.sell,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

*/