// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trippy_threads_delivery/orders/active.dart';
import 'package:trippy_threads_delivery/orders/assigned.dart';
import 'package:trippy_threads_delivery/orders/cancelled.dart';
import 'package:trippy_threads_delivery/orders/completed.dart';
import 'package:trippy_threads_delivery/orders/returned.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("ORDERS"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(child: Text("Assigned")),
                Tab(child: Text("Active")),
                Tab(child: Text("Complete")),
                Tab(child: Text("Returns")),
                Tab(child: Text("Cancelled")),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Assigned(),
              Active(),
              Completed(),
              Returned(),
              Cancelled(),
            ],
          )),
    );
  }
}
