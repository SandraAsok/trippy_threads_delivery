// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  String? selectedvalue;
  Map<String, String?> selectedValues = {};
  String? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('assigned_orders')
              .where('employee_email',
                  isEqualTo: FirebaseAuth.instance.currentUser!.email)
              // .orderBy('assigned_date', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: LinearProgressIndicator());
            }

            if (snapshot.hasError) {
              log(snapshot.error.toString());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No assigned orders found.'));
            }

            final docs = snapshot.data!.docs;

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final doc = docs[index];
                final orderDetails =
                    List<Map<String, dynamic>>.from(doc['order_details']);

                return Column(
                  children: orderDetails.map((order) {
                    String orderId = order['orderId'];
                    selectedvalue = selectedValues[orderId];
                    return Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                        ),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order ID : ${order['orderId']}"),
                            Text("Address : ${order['address']}"
                                .split(",")
                                .join("\n")),
                            Text("Product: ${order['product_name']}"),
                            Text("Quantity: ${order['quantity']}"),
                            Text("Total Price: ₹${order['totalPrice']}"),
                            SizedBox(
                              height: 50,
                              child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('orders')
                                      .doc(orderId)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    return DropdownButtonFormField(
                                      hint: Text(snapshot.data!.get('track')),
                                      value: selectedvalue,
                                      items: [
                                        'recieved',
                                        'out for delivery',
                                        'nearest hub',
                                        'delivered',
                                        'return',
                                        'cancelled',
                                      ].map((String value) {
                                        return DropdownMenuItem(
                                            value: value, child: Text(value));
                                      }).toList(),
                                      onChanged: (value) async {
                                        setState(() {
                                          selectedValues[orderId] =
                                              value.toString();
                                        });
                                        await FirebaseFirestore.instance
                                            .collection('orders')
                                            .doc(orderId)
                                            .update({
                                          'track': selectedValues[orderId]
                                        });
                                      },
                                    );
                                  }),
                            ),
                            StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('orders')
                                  .doc(orderId)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData ||
                                    snapshot.data == null) {
                                  return SizedBox();
                                }

                                phone = snapshot.data!.get('phone');

                                return TextButton.icon(
                                  label: Text("Call Customer"),
                                  onPressed: () async {
                                    if (phone != null && phone!.isNotEmpty) {
                                      final Uri url = Uri(
                                        scheme: 'tel',
                                        path: phone,
                                      );
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Could not launch phone call.')),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Phone number is not available.')),
                                      );
                                    }
                                  },
                                  icon: Icon(Icons.call),
                                );
                              },
                            ),
                          ],
                        ));
                  }).toList(),
                );
              },
            );
          }),
    );
  }
}
