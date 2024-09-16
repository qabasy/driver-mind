// ignore_for_file: prefer_const_constructors

import 'package:app/src/config/constants.dart';
import 'package:app/src/models/trading_model.dart';
import 'package:flutter/material.dart';

class TradingCard extends StatelessWidget {
  final TradingModel model;
  final void Function()? onTap, onUpdate;
  const TradingCard(
      {super.key, required this.model, this.onTap, this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (v) {},
      hoverColor: Constants.secondaryColor,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Card(
        // surfaceTintColor: Constants.accentColor,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            width: 360,
            height: 200,
            decoration: BoxDecoration(
              // border: Border.all(
              //   width: 1.5,
              //   strokeAlign: 0,
              //   // style: BorderStyle.solid,
              //   color: Theme.of(context).colorScheme.primary,
              // ),
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
                      "${Constants.number.format(model.amount)} KG",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 20,
                    child: Text(
                      Constants.currency.format(model.price),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(99, 232, 225, 225),
                        border: Border.all(
                          color: Constants.accentColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: SizedBox(
                        height: 20,
                        width: 80,
                        child: Text(
                          textAlign: TextAlign.center,
                          Constants.currency.format(model.total),
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    right: -5,
                    child: TextButton(
                      onPressed: onUpdate,
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          Constants.secondaryFgColor.withOpacity(0.5),
                        ),
                      ),
                      child: Text("Update"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
