// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ReturnWidget extends StatelessWidget {
  const ReturnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 5,
      height: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onHover: (value) {},
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(95, 255, 255, 255),
                style: BorderStyle.solid,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
              // color: Colors.amber,
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ),
      ),
    );
  }
}
