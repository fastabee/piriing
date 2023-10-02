import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:piriing/Screens/Welcome/welcome_screen.dart';
import 'package:piriing/Screens/dashboard/dashboar.dart';
import 'package:piriing/Screens/kalori/kalori.dart';
import 'package:piriing/Screens/profile/profile.dart';
import 'package:piriing/Screens/riwayat/riwayat.dart';
import 'package:piriing/bloc/nav/nav_bloc.dart';
import 'package:piriing/components/constants.dart';
import 'package:piriing/provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      // Use MultiProvider to combine multiple providers
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserProvider()), // Your ChangeNotifierProvider
        BlocProvider(create: (context) => NavBloc()), // Your BlocProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const WelcomeScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/dashboard':
            return PageTransition(
              child: const Dashboard(),
              type: PageTransitionType.fade,
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 0),
              settings: settings,
            );
          case '/kalori':
            return PageTransition(
              child: Kalori(),
              type: PageTransitionType.fade,
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 0),
              settings: settings,
            );
          case '/riwayat':
            return PageTransition(
              child: Riwayat(),
              type: PageTransitionType.fade,
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 0),
              settings: settings,
            );
          case '/profile':
            return PageTransition(
              child: const Profile(),
              type: PageTransitionType.fade,
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 0),
              settings: settings,
            );

          // case '/profile':
          //   return PageTransition(
          //     child: Ranting(),
          //     type: PageTransitionType.fade,
          //     alignment: Alignment.center,
          //     duration: Duration(milliseconds: 400),
          //     settings: settings,
          //   );
          default:
            return null;
        }
      },
    );
  }
}
