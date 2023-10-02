import 'package:flutter/material.dart';
import 'package:piriing/components/bottom_nav.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: BottomNavBar(selected: 3),
        body: SingleChildScrollView(
          child: Text('Profile()'),
        ));
  }
}
