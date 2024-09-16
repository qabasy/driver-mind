// ignore_for_file: prefer_const_constructors

import 'package:m_toast/m_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/src/models/sale_model.dart';
import 'package:app/src/models/trading_model.dart';
import 'package:app/src/models/purchase_model.dart';
import 'package:app/src/screens/transaction_pop.dart';
import 'package:app/src/widgets/inputs/input_widget.dart';
import 'package:app/src/blocs/trading_screen.dart/logic.dart';
import 'package:app/src/blocs/trading_screen.dart/state.dart';

class TradingPop extends StatelessWidget {
  final TransactionType transactionType;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final BuildContext context;
  final TradingModel model;

  TradingPop({
    super.key,
    required this.model,
    required this.context,
    required this.transactionType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TradingScreenLogic(),
      child: BlocConsumer<TradingScreenLogic, TradingScreenState>(
        listener: (context, state) {
          if (kDebugMode) {
            print("PopScree: state.$state");
          }
        },
        builder: (_, state) {
          TradingScreenLogic obj = BlocProvider.of(this.context);
          if (model.id != null) {
            nameController.text = model.customerName.trim();
            totalController.text = model.total.toString();
            priceController.text = model.price.toString();
            amountController.text = model.amount.toString();
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
                    controller: amountController,
                    onChanged: (value) {},
                    label: "Amount",
                    hint: "ex: 8,900",
                  ),
                  SizedBox(height: 12),
                  InputWidget(
                    controller: priceController,
                    onChanged: (value) {},
                    label: "Price",
                    hint: "ex: 14,500",
                    // counter: ,
                  ),
                  SizedBox(height: 12),
                  InputWidget(
                    controller: notesController,
                    onChanged: (value) {},
                    label: "Notes",
                    hint: "any notes?",
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
                          if (transactionType == TransactionType.buy) {
                            await obj.insertPurchase(
                              PurchaseModel(
                                customerName: nameController.text,
                                amount:
                                    double.tryParse(amountController.text) ?? 0,
                                price:
                                    double.tryParse(priceController.text) ?? 0,
                                createDate: DateTime.now(),
                                total: (double.tryParse(
                                            amountController.text) ??
                                        0) *
                                    (double.tryParse(priceController.text) ??
                                        0) /
                                    1000,
                              ),
                            );
                          } else if (transactionType == TransactionType.sell) {
                            await obj.insertSale(
                              SaleModel(
                                customerName: nameController.text,
                                amount:
                                    double.tryParse(amountController.text) ?? 0,
                                price:
                                    double.tryParse(priceController.text) ?? 0,
                                createDate: DateTime.now(),
                                total: (double.tryParse(
                                            amountController.text) ??
                                        0) *
                                    (double.tryParse(priceController.text) ??
                                        0) /
                                    1000,
                              ),
                            );
                          } else if (transactionType ==
                              TransactionType.editBuy) {
                            await obj.updatePurchase(
                              PurchaseModel(
                                id: model.id,
                                customerName: nameController.text,
                                amount:
                                    double.tryParse(amountController.text) ?? 0,
                                price:
                                    double.tryParse(priceController.text) ?? 0,
                                createDate: DateTime.now(),
                                total: (double.tryParse(
                                            amountController.text) ??
                                        0) *
                                    (double.tryParse(priceController.text) ??
                                        0) /
                                    10000,
                              ),
                            );
                          } else if (transactionType ==
                              TransactionType.editSell) {
                            await obj.updateSale(
                              SaleModel(
                                id: model.id,
                                customerName: nameController.text,
                                amount:
                                    double.tryParse(amountController.text) ?? 0,
                                price:
                                    double.tryParse(priceController.text) ?? 0,
                                createDate: DateTime.now(),
                                total: (double.tryParse(
                                            amountController.text) ??
                                        0) *
                                    (double.tryParse(priceController.text) ??
                                        0) /
                                    1000,
                              ),
                            );
                          }

                          ShowMToast(this.context).successToast(
                              message: "Successful Trading Action",
                              alignment: Alignment.bottomCenter);
                          Navigator.of(this.context).pop();
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
      ),
    );
  }
}
