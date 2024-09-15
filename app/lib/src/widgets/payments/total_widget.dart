// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/src/config/constants.dart';
import 'package:flutter/material.dart';

class TotalWidget extends StatelessWidget {
  final TotalData totalData;
  const TotalWidget({super.key, required this.totalData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Container(
        child: Card(
          shape: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 218, 213, 213),
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          borderOnForeground: true,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Paid".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      Constants.currency.format(totalData.paid),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 2,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(31, 227, 35, 35),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Received".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      Constants.currency.format(totalData.received),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TotalData {
  final double paid, received;
  TotalData({required this.paid, required this.received});
}
