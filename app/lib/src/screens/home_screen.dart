// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // width: 360,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Balance,
              // for (int index = 0; index < 4; index++) Text("Item#$index"),
            ],
          ),
        ),
      ),
    );
  }
}
