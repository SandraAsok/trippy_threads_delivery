// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Returned extends StatefulWidget {
  const Returned({super.key});

  @override
  State<Returned> createState() => _ReturnedState();
}

class _ReturnedState extends State<Returned> {
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
                color: Colors.purple[50],
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
                        Text("Expected Delivered Date : 2022-02-02"),
                        Text("Return Date : 2022-02-02"),
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
