// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List colors = [
    Colors.green,
    Colors.purple,
    Colors.yellow,
    Colors.red,
  ];

  List containercolors = [
    Colors.lightBlue[50],
    Colors.deepPurple[100],
    Colors.deepOrange[100],
    Colors.yellow[100],
  ];

  List icons = [
    Icons.card_giftcard,
    Icons.timelapse_outlined,
    Icons.delivery_dining,
    Icons.cancel,
  ];

  List headings = [
    "Completed Delivery",
    "Pending Delivery",
    "Returned Delivery",
    "Cancelled Delivery",
  ];

  bool status = false;

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
            SizedBox(
              height: 450,
              width: double.infinity,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: containercolors[index],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icons[index],
                          size: 50,
                          color: colors[index],
                        ),
                        Text(
                          headings[index],
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "15",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Todays Target",
                style: GoogleFonts.abhayaLibre(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Total Deliveries Assigned",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 20,
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    " : 15",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 20,
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Total Returns",
                    style: GoogleFonts.abhayaLibre(
                        color: Colors.deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    " : 8",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 20,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Cancelled Orders",
                    style: GoogleFonts.abhayaLibre(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    " : 2",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
