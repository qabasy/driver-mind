// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/src/blocs/home_screen/logic.dart';
import 'package:app/src/blocs/home_screen/state.dart';
import 'package:app/src/config/constants.dart';
import 'package:app/src/widgets/home_app_bar.dart';
import 'package:app/src/widgets/new_total_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenLogic()..getTotal(),
      child: BlocBuilder<HomeScreenLogic, HomeScreenState>(
        builder: (context, state) {
          HomeScreenLogic obj = BlocProvider.of(context);
          return Scaffold(
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    // color: Theme.of(context).secondaryHeaderColor,
                    ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HomeAppBar(),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Constants.colorScheme.secondary
                                .withOpacity(0.4),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            Constants.currency.format(obj.balance),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              fontSize: 50,
                              color: Constants.colorScheme.onSecondary
                                  .withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0 * 2),
                        child: NewTotalWidget(
                          model: NewTotalModel(
                            topRight: Constants.number.format(obj.tradingCount),
                            title: "Trading",
                            sub_1: "Purchases",
                            sub_2: "Sales",
                            total_1: Constants.currency.format(
                              obj.totalTradingPurchases,
                            ),
                            total_2: Constants.currency.format(
                              obj.totalTradingSales,
                            ),
                            amount_1: "${Constants.number.format(
                              obj.totalTradingPurchasesAmount,
                            )} TON",
                            amount_2: "${Constants.number.format(
                              obj.totalTradingSalesAmount,
                            )} TON",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0 * 2),
                        child: NewTotalWidget(
                          model: NewTotalModel(
                            topRight:
                                Constants.number.format(obj.paymentsCount),
                            title: "Transactions",
                            sub_1: "Paid",
                            sub_2: "Received",
                            total_1: Constants.currency.format(
                              obj.totalPaymentsSend,
                            ),
                            total_2: Constants.currency.format(
                              obj.totalPaymentsReceive,
                            ),
                            amount_1: "",
                            amount_2: "",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
