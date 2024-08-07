// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Active extends StatefulWidget {
  const Active({super.key});

  @override
  State<Active> createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.yellow[50],
              ),
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(
                    width: 150,
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNwf9qWGawPjoa1EW9h8BZzwCdyutgv9vm5w&s",
                  ),
                  Column(
                    children: [
                      Text("Order ID : hjbchjbshjfbhjdbhjd"),
                      Text("Address :"),
                      Text(
                          "Sandra+8075190230+Sandram(H)+South Kondazhy+Chelakkara +Thrissur+679106"
                              .split("+")
                              .join("\n")),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
                                ),
                                onPressed: () {},
                                child: Text("Update Status",
                                    style: GoogleFonts.abhayaLibre(
                                        color: Colors.white))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blue[100]),
                                ),
                                onPressed: () {},
                                child: Icon(Icons.call)),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }
}
