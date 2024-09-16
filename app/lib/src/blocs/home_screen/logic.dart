import 'package:app/src/blocs/home_screen/state.dart';
import 'package:app/src/models/database_model.dart';
import 'package:app/src/screens/home_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeScreenLogic extends Cubit<HomeScreenState> {
  double balance = 0;
  double totalTradingSales = 0,
      totalTradingSalesAmount = 0,
      totalTradingPurchases = 0,
      totalTradingPurchasesAmount = 0,
      tradingCount = 0,
      tradingSalesCount = 0,
      tradingPurchasesCount = 0;

  double totalPaymentsSend = 0,
      // totalPaymentsSendAmount = 0,
      totalPaymentsReceive = 0,
      // totalPaymentsReceiveAmount = 0,
      paymentsCount = 0,
      paymentsSendCount = 0,
      paymentsReceiveCount = 0;
  Widget currentScreen = const HomeScreen();

  // HomeScreenLogic
  HomeScreenLogic() : super(HomeScreenInitState());

  // Logic
  Future<void> getTotal() async {
    await DatabaseHelper.instance.database.then(
      (db) async {
        // * get trading total

        // purchases
        await db
            .rawQuery(
                "SELECT SUM(total) as total, SUM(amount) as amount, COUNT(*) AS count FROM purchases")
            .then(
          (value) {
            if (value.isNotEmpty) {
              if (value[0].containsKey("total")) {
                double v = double.tryParse(
                      value[0]["total"].toString(),
                    ) ??
                    0;
                totalTradingPurchases = v;
                balance -= v;
              }
              if (value[0].containsKey("amount")) {
                totalTradingPurchasesAmount = double.tryParse(
                      value[0]["amount"].toString(),
                    ) ??
                    0;
              }
              if (value[0].containsKey("count")) {
                tradingCount += double.tryParse(
                      value[0]["count"].toString(),
                    ) ??
                    0;
              }
            }
          },
        );

        // sales
        await db
            .rawQuery(
                "SELECT SUM(total) as total, SUM(amount) as amount, COUNT(*) AS count FROM sales")
            .then(
          (value) {
            if (value.isNotEmpty) {
              if (value[0].containsKey("total")) {
                double v = double.tryParse(
                      value[0]["total"].toString(),
                    ) ??
                    0;
                totalTradingSales = v;
                balance += v;
              }
              if (value[0].containsKey("amount")) {
                totalTradingSalesAmount = double.tryParse(
                      value[0]["amount"].toString(),
                    ) ??
                    0;
              }
              if (value[0].containsKey("count")) {
                tradingCount += double.tryParse(
                      value[0]["count"].toString(),
                    ) ??
                    0;
              }
            }
          },
        );

        // * payments

        // send transactions
        await db
            .rawQuery(
                "SELECT SUM(amount) as total, COUNT(*) AS count FROM ReceiveTransactions")
            .then(
          (value) {
            if (value.isNotEmpty) {
              if (value[0].containsKey("total")) {
                double v = double.tryParse(
                      value[0]["total"].toString(),
                    ) ??
                    0;
                totalPaymentsReceive = v;
                balance += v;
              }

              if (value[0].containsKey("count")) {
                double v = double.tryParse(
                      value[0]["count"].toString(),
                    ) ??
                    0;

                paymentsReceiveCount = v;
                paymentsCount += v;
              }
            }
          },
        );
        await db
            .rawQuery(
                "SELECT SUM(amount) as total, COUNT(*) AS count FROM SendTransactions")
            .then(
          (value) {
            if (value.isNotEmpty) {
              if (value[0].containsKey("total")) {
                double v = double.tryParse(
                      value[0]["total"].toString(),
                    ) ??
                    0;
                totalPaymentsSend = v;
                balance -= v;
              }

              if (value[0].containsKey("count")) {
                double v = double.tryParse(
                      value[0]["count"].toString(),
                    ) ??
                    0;

                paymentsSendCount = v;
                paymentsCount += v;
              }
            }
          },
        );
      },
    );

    emit(HomeScreenGetTotalsState());
  }
}
