// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'DASHBOARD',
          style: GoogleFonts.abhayaLibre(
              fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Lottie.asset('assets/dashboard.json'),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('employees_delivery')
                    .where('email',
                        isEqualTo: FirebaseAuth.instance.currentUser!.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  final snap = snapshot.data!.docs[0];
                  return UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.white),
                      accountName: Text(snap['name'],
                          style: TextStyle(color: Colors.black)),
                      accountEmail: Text(snap['email'],
                          style: TextStyle(color: Colors.black)));
                }),
            Container(),
          ],
        ),
      ),
    );
  }
}
