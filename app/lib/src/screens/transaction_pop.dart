// ignore_for_file: prefer_const_constructors

import 'package:app/src/blocs/transactions_screen.dart/logic.dart';
import 'package:app/src/blocs/transactions_screen.dart/state.dart';
import 'package:app/src/models/receive_transaction_model.dart';
import 'package:app/src/models/send_transaction_model.dart';
import 'package:app/src/models/transaction_model.dart';
import 'package:app/src/widgets/inputs/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPop extends StatelessWidget {
  final TransactionType transactionType;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TransactionModel model;
  // final Function(TransactionModel) onSubmit;
  TransactionPop({
    super.key,
    required this.model,
    required this.transactionType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionsScreenLogic(),
      child: BlocConsumer<TransactionsScreenLogic, TransactionsScreenState>(
          builder: (context, state) {
            TransactionsScreenLogic obj = BlocProvider.of(context);
            nameController.text = (model is SendTransactionModel
                ? (model as SendTransactionModel).customerName
                : (model as ReceiveTransactionModel).customerName);

            moneyController.text = (model is SendTransactionModel
                ? (model as SendTransactionModel).amount.toString()
                : (model as ReceiveTransactionModel).amount.toString());
            notesController.text = (model is SendTransactionModel
                ? (model as SendTransactionModel).notes.toString()
                : (model as ReceiveTransactionModel).notes.toString());
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InputWidget(
                      // initialValue: (model is SendTransactionModel
                      //     ? (model as SendTransactionModel).customerName
                      //     : (model as ReceiveTransactionModel).customerName),
                      controller: nameController,
                      onChanged: (value) {},
                      label: "Name",
                      hint: (transactionType == TransactionType.receive
                          ? "from"
                          : "to"),
                    ),
                    SizedBox(height: 12),
                    InputWidget(
                      // initialValue: (model is SendTransactionModel
                      //         ? (model as SendTransactionModel).amount
                      //         : (model as ReceiveTransactionModel).amount)
                      //     .toString(),
                      controller: moneyController,
                      onChanged: (value) {},
                      label: "Money",
                      hint: "amount",
                    ),
                    SizedBox(height: 12),
                    InputWidget(
                      // initialValue: (model is SendTransactionModel
                      //         ? (model as SendTransactionModel).notes
                      //         : (model as ReceiveTransactionModel).notes)
                      //     .toString(),
                      controller: notesController,
                      onChanged: (value) {},
                      label: "Notes",
                      hint: "any notes?",
                    ),
                    SizedBox(height: 20),
                    // (transactionType == TransactionType.editSend ||)
                    // SizedBox(height: 20),
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
                            Navigator.of(context).pop();
                            if (transactionType == TransactionType.send) {
                              await obj.insertSendTransaction(
                                SendTransactionModel(
                                  id: null,
                                  amount:
                                      double.tryParse(moneyController.text) ??
                                          0,
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
                                      double.tryParse(moneyController.text) ??
                                          0,
                                  createDate: DateTime.now(),
                                  customerName: nameController.text.trim(),
                                  notes: notesController.text.trim(),
                                ),
                              );
                            } else if (transactionType ==
                                TransactionType.editSend) {
                              obj.updateSendTransaction(
                                SendTransactionModel(
                                  id: (model as SendTransactionModel).id,
                                  amount:
                                      double.tryParse(moneyController.text) ??
                                          0,
                                  createDate: DateTime.now(),
                                  customerName: nameController.text.trim(),
                                  notes: notesController.text.trim(),
                                ),
                              );
                            } else if (transactionType ==
                                TransactionType.editReceive) {
                              obj.updateReceiveTransaction(
                                ReceiveTransactionModel(
                                  id: (model as ReceiveTransactionModel).id,
                                  amount:
                                      double.tryParse(moneyController.text) ??
                                          0,
                                  createDate: DateTime.now(),
                                  customerName: nameController.text.trim(),
                                  notes: notesController.text.trim(),
                                ),
                              );
                            }
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
          listener: (c, s) {}),
    );
  }
}

enum TransactionType { send, receive, editSend, editReceive }
