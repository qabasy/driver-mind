// ignore_for_file: prefer_const_constructors

import 'package:app/src/blocs/transactions_screen.dart/logic.dart';
import 'package:app/src/blocs/transactions_screen.dart/state.dart';
import 'package:app/src/models/receive_transaction_model.dart';
import 'package:app/src/models/send_transaction_model.dart';
import 'package:app/src/models/transaction_model.dart';
import 'package:app/src/widgets/inputs/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_toast/m_toast.dart';

class TransactionPop extends StatelessWidget {
  final TransactionType transactionType;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TransactionModel model;
  BuildContext context;

  TransactionPop({
    super.key,
    required this.context,
    required this.model,
    required this.transactionType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionsScreenLogic(),
      child: BlocConsumer<TransactionsScreenLogic, TransactionsScreenState>(
        builder: (_, state) {
          TransactionsScreenLogic obj = BlocProvider.of(this.context);
          if (model.id != null) {
            nameController.text = model.customerName;
            moneyController.text = model.amount.toString();
            notesController.text = model.notes ?? "";
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InputWidget(
                    controller: nameController,
                    onChanged: (value) {},
                    label: "Name",
                    hint: "ex: mahros",
                  ),
                  SizedBox(height: 12),
                  InputWidget(
                    controller: moneyController,
                    onChanged: (value) {},
                    label: "Money",
                    hint: "ex: 150,300",
                  ),
                  SizedBox(height: 12),
                  InputWidget(
                    controller: notesController,
                    onChanged: (value) {},
                    label: "Notes",
                    hint: "Any notes?",
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.all(25)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Ignore"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (transactionType == TransactionType.send) {
                            await obj.insertSendTransaction(
                              SendTransactionModel(
                                id: null,
                                amount:
                                    double.tryParse(moneyController.text) ?? 0,
                                createDate: DateTime.now(),
                                customerName: nameController.text.trim(),
                                notes: notesController.text.trim(),
                              ),
                            );
                          } else if (transactionType ==
                              TransactionType.receive) {
                            await obj.insertReceiveTransaction(
                              ReceiveTransactionModel(
                                id: null,
                                amount:
                                    double.tryParse(moneyController.text) ?? 0,
                                createDate: DateTime.now(),
                                customerName: nameController.text.trim(),
                                notes: notesController.text.trim(),
                              ),
                            );
                          } else if (transactionType ==
                              TransactionType.editSend) {
                            await obj.updateSendTransaction(
                              SendTransactionModel(
                                id: (model as SendTransactionModel).id,
                                amount:
                                    double.tryParse(moneyController.text) ?? 0,
                                createDate: DateTime.now(),
                                customerName: nameController.text.trim(),
                                notes: notesController.text.trim(),
                              ),
                            );
                          } else if (transactionType ==
                              TransactionType.editReceive) {
                            await obj.updateReceiveTransaction(
                              ReceiveTransactionModel(
                                id: (model as ReceiveTransactionModel).id,
                                amount:
                                    double.tryParse(moneyController.text) ?? 0,
                                createDate: DateTime.now(),
                                customerName: nameController.text.trim(),
                                notes: notesController.text.trim(),
                              ),
                            );
                          }

                          if ([
                            TransactionType.receive,
                            TransactionType.editReceive
                          ].contains(
                            transactionType,
                          )) {
                            obj.selectedTabIndex = 1;
                          } else {
                            obj.selectedTabIndex = 0;
                          }

                          ShowMToast(this.context).successToast(
                            duration: 1000,
                            message: "Success! Successful Transaction.",
                            alignment: Alignment.bottomCenter,
                          );
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.all(25)),
                        ),
                        child: Text("Submit"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        listener: (c, s) {},
      ),
    );
  }
}

enum TransactionType {
  // * [Trading]
  buy,
  sell,
  editBuy,
  editSell,

  // * [Payments]
  send,
  receive,
  editSend,
  editReceive,
}
