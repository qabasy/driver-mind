// ignore_for_file: prefer_const_constructors

import 'package:app/src/blocs/trading_screen.dart/logic.dart';
import 'package:app/src/blocs/trading_screen.dart/state.dart';
import 'package:app/src/config/constants.dart';
import 'package:app/src/widgets/payments/total_widget.dart';
import 'package:app/src/widgets/return_widget.dart';
import 'package:app/src/widgets/tabs/rounded_tab.dart';
import 'package:app/src/widgets/totals_widget.dart';
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
      create: (context) => TradingScreenLogic(),
      child: BlocConsumer<TradingScreenLogic, TradingScreenState>(
        listener: (context, state) {
          print("State: $state");
        },
        builder: (context, state) {
          TradingScreenLogic obj = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Trading"),
              leading: ReturnWidget(),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("Trading"),
              ),
            ),
            floatingActionButton: SpeedDial(
              children: [
                SpeedDialChild(
                  child: Icon(Icons.abc),
                  elevation: 10,
                  label: "Buy Stock",
                  onTap: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
