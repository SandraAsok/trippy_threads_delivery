// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Assigned extends StatefulWidget {
  const Assigned({super.key});

  @override
  State<Assigned> createState() => _AssignedState();
}

class _AssignedState extends State<Assigned> {
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
                color: Colors.green[50],
              ),
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(
                      width: 150,
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNwf9qWGawPjoa1EW9h8BZzwCdyutgv9vm5w&s"),
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
                                  backgroundColor: MaterialStateProperty.all(
                                      status ? Colors.blueGrey : Colors.green),
                                ),
                                onPressed: () {
                                  setState(() {
                                    status = !status;
                                  });
                                },
                                child: Text(status ? "Update Status" : "Accept",
                                    style: GoogleFonts.abhayaLibre(
                                        color: Colors.white))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Reject",
                                  style: GoogleFonts.abhayaLibre(
                                      color: Colors.white),
                                )),
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
