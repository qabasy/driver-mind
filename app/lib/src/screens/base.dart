// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:app/src/screens/home_screen.dart';
import 'package:app/src/screens/tradings_screen.dart';
import 'package:app/src/screens/transactions_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 1;
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              currentScreen = TransactionsScreen();
              break;
            case 1:
              currentScreen = HomeScreen();
              break;
            case 2:
              currentScreen = TradingScreen();
              break;
            default:
          }
          currentIndex = index;
          setState(() {});
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            label: "Transactions",
            icon: Icon(Icons.import_export),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "Trading",
            icon: Icon(Icons.point_of_sale_rounded),
          ),
        ],
      ),
    );
  }
}
