import 'package:flutter/material.dart';

class SaleTimer extends StatefulWidget {
  const SaleTimer({super.key});

  @override
  State<SaleTimer> createState() => _SaleTimerState();
}

class _SaleTimerState extends State<SaleTimer> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      '02:59:23',
      style: TextStyle(
          fontFamily: 'Lato', fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
