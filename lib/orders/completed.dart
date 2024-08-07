// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.orange[50],
              ),
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(
                    width: 100,
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNwf9qWGawPjoa1EW9h8BZzwCdyutgv9vm5w&s",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Spacer(),
                        Text("Order ID : hjbchjbshjfbhjdbhjd"),
                        Text("Issued Date : 2022-02-02"),
                        Text("Delivered Date : 2022-02-02"),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
