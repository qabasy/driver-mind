// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:app/src/widgets/trading_card.dart';
import 'package:flutter/material.dart';
import 'package:app/src/config/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/src/models/sale_model.dart';
import 'package:app/src/screens/trading_pop.dart';
import 'package:app/src/models/purchase_model.dart';
import 'package:app/src/screens/transaction_pop.dart';
import 'package:app/src/utils/show_custom_dialog.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:app/src/blocs/trading_screen.dart/logic.dart';
import 'package:app/src/blocs/trading_screen.dart/state.dart';

class TradingScreen extends StatelessWidget {
  final TextEditingController notesController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController customerNameController = TextEditingController();

  TradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TradingScreenLogic()
        ..getPurchases()
        ..getSales(),
      child: BlocConsumer<TradingScreenLogic, TradingScreenState>(
        listener: (context, state) {
          print("State: $state");
        },
        builder: (context, state) {
          TradingScreenLogic obj = BlocProvider.of(context);
          return DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(tabs: [
                  Tab(
                    text: "Purchases",
                    // icon: Icon(Icons.production_quantity_limits),
                  ),
                  Tab(
                    text: "Sales",
                    // icon: Icon(Icons.production_quantity_limits),
                  ),
                ]),
                centerTitle: true,
                title: Text("Trading"),
              ),
              body: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                "${obj.sales.length}",
                                // style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        for (int index = 0; index < obj.sales.length; index++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: TradingCard(model: obj.sales[index]),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Purchases",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
              ]),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
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
                          context: context,
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
                    onTap: () async {
                      showCustomDialog(
                        onDeletePressed: () {},
                        context,
                        content: TradingPop(
                          context: context,
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
            ),
          );
        },
      ),
    );
  }
}
