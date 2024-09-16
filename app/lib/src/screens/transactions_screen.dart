// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:app/src/blocs/transactions_screen.dart/logic.dart';
import 'package:app/src/blocs/transactions_screen.dart/state.dart';
import 'package:app/src/config/constants.dart';
import 'package:app/src/models/receive_transaction_model.dart';
import 'package:app/src/models/send_transaction_model.dart';
import 'package:app/src/screens/transaction_pop.dart';
import 'package:app/src/utils/show_custom_dialog.dart';
import 'package:app/src/widgets/payments/total_widget.dart';
import 'package:app/src/widgets/tabs/rounded_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class TransactionsScreen extends StatelessWidget {
  final TextEditingController notesController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController customerNameController = TextEditingController();

  TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionsScreenLogic()
        ..getTotalPaid()
        ..getTotalReceived()
        ..getReceiveTransactions()
        ..getSendTransactions()
        ..toggleTransactionType(),
      child: BlocConsumer<TransactionsScreenLogic, TransactionsScreenState>(
        listener: (context, state) {
          print("State: $state");
        },
        builder: (context, state) {
          TransactionsScreenLogic obj = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Transactions"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    TotalWidget(
                      totalData: TotalData(
                        paid: obj.totalPaid,
                        received: obj.totalReceived,
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: SizedBox(
                        width: 360,
                        child: Card(
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 218, 213, 213),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          borderOnForeground: true,
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 15),
                                  RoundedTab(
                                    onTap: () {
                                      obj.toggleTransactionType();
                                      print("Toggle");
                                    },
                                    selectedIndex: obj.selectedTabIndex,
                                  ),
                                  SizedBox(height: 20),
                                  for (int index = 0;
                                      index <
                                          (obj.selectedTabIndex == 0
                                              ? obj.sendTransactions.length
                                              : obj.receiveTransactions.length);
                                      index++)
                                    Column(
                                      children: [
                                        ListTile(
                                          splashColor: Theme.of(context)
                                              .secondaryHeaderColor,
                                          hoverColor: Theme.of(context)
                                              .secondaryHeaderColor,
                                          shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                              width: 1,
                                            ),
                                          ),
                                          onTap: () {
                                            showCustomDialog(context,
                                                content: TransactionPop(
                                                  context: context,
                                                  model: (obj.selectedTabIndex ==
                                                          0
                                                      ? obj.sendTransactions[
                                                          index]
                                                      : obj.receiveTransactions[
                                                          index]),
                                                  transactionType:
                                                      (obj.selectedTabIndex == 0
                                                          ? TransactionType
                                                              .editSend
                                                          : TransactionType
                                                              .editReceive),
                                                ),
                                                title: "Edit Transaction",
                                                onDeletePressed: () {
                                              (obj.selectedTabIndex == 0
                                                  ? obj.removeSendTransaction(
                                                      obj.sendTransactions[
                                                          index])
                                                  : obj
                                                      .removeReceiveTransaction(
                                                      obj.receiveTransactions[
                                                          index],
                                                    ));

                                              Navigator.of(context).pop();
                                            });
                                          },
                                          titleAlignment:
                                              ListTileTitleAlignment.center,
                                          title: SizedBox(
                                            width: 100,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                (obj.selectedTabIndex == 0
                                                    ? obj
                                                        .sendTransactions[index]
                                                        .customerName
                                                    : obj
                                                        .receiveTransactions[
                                                            index]
                                                        .customerName),
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ),
                                          subtitle: SizedBox(
                                            width: 100,
                                            child: Text(
                                              (obj.selectedTabIndex == 0
                                                      ? obj
                                                          .sendTransactions[
                                                              index]
                                                          .notes
                                                      : obj
                                                          .receiveTransactions[
                                                              index]
                                                          .notes) ??
                                                  "",
                                              // .notes ??
                                              // " ",
                                              overflow: TextOverflow.fade,
                                            ),
                                          ),
                                          leadingAndTrailingTextStyle:
                                              TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          trailing: SizedBox(
                                            width: 60,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                Constants.currency.format(
                                                  (obj.selectedTabIndex == 0
                                                      ? obj
                                                          .sendTransactions[
                                                              index]
                                                          .amount
                                                      : obj
                                                          .receiveTransactions[
                                                              index]
                                                          .amount),
                                                  // .amount,
                                                ),
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        )
                                      ],
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // bottomNavigationBar: AnimatedBottomNavigationBar(
            //   barColor: Colors.white,
            //   controller: FloatingBottomBarController(
            //     initialIndex: 1,
            //   ),
            //   bottomBar: const [],
            //   bottomBarCenterModel: BottomBarCenterModel(
            //     centerBackgroundColor: Theme.of(context).primaryColor,
            //     centerIcon: const FloatingCenterButton(
            //       child: Icon(
            //         Icons.add,
            //         color: AppColors.white,
            //       ),
            //     ),
            //     centerIconChild: [
            //       FloatingCenterButtonChild(
            //         child: Icon(
            //           Icons.call_made_rounded,
            //           color: AppColors.white,
            //         ),
            //         onTap: () async {
            //           showCustomDialog(
            //             context,
            //             title: "Send Money",
            //             content: TransactionPop(
            //               transactionType: TransactionType.send,
            //               model: SendTransactionModel.empty(),
            //             ),
            //           );
            //         },
            //       ),
            //       FloatingCenterButtonChild(
            //         child: Icon(
            //           Icons.call_received_rounded,
            //           color: AppColors.white,
            //         ),
            //         onTap: () {
            //           showCustomDialog(
            //             context,
            //             title: ("Receive Money"),
            //             content: TransactionPop(
            //               transactionType: TransactionType.receive,
            //               model: ReceiveTransactionModel.empty(),
            //             ),
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),

            floatingActionButton: SpeedDial(
              child: Icon(Icons.add),
              activeIcon: Icons.close_rounded,
              children: [
                SpeedDialChild(
                  label: "Receive",
                  child: Icon(Icons.call_received_rounded),
                  onTap: () {
                    showCustomDialog(
                      context,
                      title: ("Receive Money"),
                      content: TransactionPop(
                        context: context,
                        transactionType: TransactionType.receive,
                        model: ReceiveTransactionModel.empty(),
                      ),
                    );
                  },
                ),
                SpeedDialChild(
                  label: "Pay",
                  child: Icon(Icons.call_made_rounded),
                  onTap: () {
                    showCustomDialog(
                      context,
                      title: "Pay Money",
                      content: TransactionPop(
                        context: context,
                        transactionType: TransactionType.send,
                        model: SendTransactionModel.empty(),
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
