// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Image(image: AssetImage("assets/app.png")),
      ),
    );
  }
}
