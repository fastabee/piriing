import 'package:flutter/material.dart';
import 'package:piriing/components/bottom_nav.dart';

class Kalori extends StatefulWidget {
  const Kalori({super.key});

  @override
  State<Kalori> createState() => _KaloriState();
}

class _KaloriState extends State<Kalori> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: BottomNavBar(selected: 1),
        body: SingleChildScrollView(
          child: Text('Kalori()'),
        ));
  }
}
