// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/src/config/constants.dart';
import 'package:flutter/material.dart';

class NewTotalWidget extends StatelessWidget {
  final void Function()? onShare;
  final NewTotalModel model;
  const NewTotalWidget({super.key, this.onShare, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 3,
              left: 5,
              child: Text(
                model.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: ElevatedButton(
                onPressed: onShare,
                child: Text(
                  model.topRight,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Constants.colorScheme.onPrimaryContainer,
                      ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              bottom: -19,
              right: -8,
              left: -8,
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.colorScheme.secondaryFixedDim,
                  borderRadius: BorderRadius.circular(
                    // topLeft: Radius.circular(15),
                    // topRight: Radius.circular(15)),
                    15,
                  ),
                ),
                padding: EdgeInsets.all(8),
                child: Stack(
                  children: [
                    Positioned(
                      top: 3,
                      left: 5,
                      width: 270,
                      // height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.sub_1,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Constants.colorScheme.onSecondary
                                          .withOpacity(0.5),
                                    ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    model.total_1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 32,
                                        ),
                                  ),
                                  // Text(
                                  //   model.amount_1,
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .bodyLarge!
                                  //       .copyWith(
                                  //         fontWeight: FontWeight.w500,
                                  //         color: Theme.of(context)
                                  //             .colorScheme
                                  //             .surfaceContainerLow,
                                  //       ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.sub_2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Constants.colorScheme.onSecondary
                                          .withOpacity(0.5),
                                    ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    model.total_2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                          // color: Theme.of(context)
                                          //     .colorScheme
                                          //     .surfaceContainerLow,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 25,
                                        ),
                                  ),
                                  // Text(
                                  //   model.amount_2,
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .bodyLarge!
                                  //       .copyWith(
                                  //         fontWeight: FontWeight.w500,
                                  //         color: Theme.of(context)
                                  //             .colorScheme
                                  //             .surfaceContainerLow,
                                  //       ),
                                  // ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // Positioned(
                    //   top: 3,
                    //   right: 5,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       SizedBox(
                    //         height: 15,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewTotalModel {
  final String title,
      sub_1,
      sub_2,
      total_1,
      total_2,
      amount_1,
      amount_2,
      topRight;
  NewTotalModel({
    required this.title,
    required this.sub_1,
    required this.sub_2,
    required this.total_1,
    required this.total_2,
    required this.amount_1,
    required this.amount_2,
    required this.topRight,
  });
}
