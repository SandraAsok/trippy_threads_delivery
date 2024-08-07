// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippy_threads_delivery/authentication/signup.dart';
import 'package:trippy_threads_delivery/firebase_options.dart';
import 'package:trippy_threads_delivery/utilities/bottomNav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(child: Splash()),
  ));
}

class Splash extends StatefulWidget {
  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool user = false;
  Future getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var status = await preferences.getBool('user');
    setState(() {
      user = status ?? false;
    });
  }

  @override
  void initState() {
    getUser().whenComplete(() {
      if (user == false) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Signup(),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNav(),
            ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
