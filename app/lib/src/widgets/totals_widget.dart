// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TotalsWidget extends StatelessWidget {
  const TotalsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
        boxShadow: [
          // BoxShadow(color: Colors.red),
          // BoxShadow(color: Colors.red),
          // BoxShadow(color: Colors.red),
          // BoxShadow(color: Colors.red),
        ],
      ),
      width: 360,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 10,
            child: Text("data"),
          ),
        ],
      ),
    );
    
  }
}
