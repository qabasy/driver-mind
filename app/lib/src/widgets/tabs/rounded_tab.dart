// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RoundedTab extends StatelessWidget {
  final void Function()? onTap;
  final int selectedIndex;
  const RoundedTab({super.key, required this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        border: Border.all(
          color: const Color.fromARGB(133, 74, 74, 74),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedTabButton(
              onTap: onTap,
              title: "Paid",
              isSelected: selectedIndex == 0 ? true : false,
            ),
            RoundedTabButton(
              onTap: onTap,
              title: "Received",
              isSelected: selectedIndex == 1 ? true : false,
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedTabButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final bool isSelected;
  const RoundedTabButton({
    super.key,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      onHover: (value) {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          // border: ,
          color: (isSelected
              ? Colors.black
              : Theme.of(context).secondaryHeaderColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: (isSelected ? Colors.white : Colors.black),
                fontWeight: (isSelected ? FontWeight.w500 : FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
