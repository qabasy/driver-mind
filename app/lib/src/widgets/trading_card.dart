// ignore_for_file: prefer_const_constructors

import 'package:app/src/config/constants.dart';
import 'package:app/src/models/trading_model.dart';
import 'package:flutter/material.dart';

class TradingCard extends StatelessWidget {
  final TradingModel model;
  const TradingCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          strokeAlign: 0,
          style: BorderStyle.solid,
          color: Theme.of(context).colorScheme.primary,
        ),
        color: Theme.of(context).colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 60,
              left: 20,
              child: Text(
                "Mahros Mohamed Mahros",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Positioned(
              top: 90,
              left: 20,
              child: Text(
                "Amount: ${Constants.unit.format(model.amount)}",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Positioned(
              top: 120,
              left: 20,
              child: Text(
                "Price: ${Constants.unit.format(model.price)}",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Positioned(
              top: -9,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(99, 232, 225, 225),
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      width: 0.9,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(2),
                    bottom: Radius.circular(15),
                  ),
                ),
                child: SizedBox(
                  width: 80,
                  child: Text(
                    textAlign: TextAlign.center,
                    Constants.currency.format(model.total),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -5,
              left: 0,
              width: 30,
              child: CircleAvatar(
                child: Text(
                  "1",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 18,
                      ),
                ),
              ),
            ),
            Positioned(
              top: -19,
              left: 0.5,
              width: 10,
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
