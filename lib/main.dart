import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piriing/Screens/Welcome/welcome_screen.dart';
import 'package:piriing/Screens/kalori/kalori.dart';
import 'package:get/get.dart';
import 'package:piriing/Screens/profile/profile.dart';
import 'package:piriing/Screens/riwayat/riwayat.dart';
import 'package:piriing/Screens/splashscreen/splashscreen.dart';
import 'package:piriing/Screens/tambahdarah/inputdarah.dart';
import 'package:piriing/bloc/nav/nav_bloc.dart';
import 'package:piriing/databaseprovider.dart';
import 'package:piriing/provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Tambahkan baris ini untuk mengimpor pustaka intl

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        BlocProvider(
          create: (context) => NavBloc(),
        ),
      ],
      child: MaterialApp(
        home: InputDarah(
          currentDateFromCalendar:
              DateFormat('yyyy-MM-dd').format(DateTime.now()),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
