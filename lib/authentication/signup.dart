// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:trippy_threads_delivery/authentication/signin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  String errormessage = "";

  validateEmail(String emailid) {
    const pattern =
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]{2,}$';
    final RegExp regExp = RegExp(pattern);
    if (emailid.isEmpty) {
      setState(() {
        errormessage = "Enter an email address";
      });
    } else if (!regExp.hasMatch(emailid)) {
      setState(() {
        errormessage = "Enter valid email id";
      });
    } else {
      setState(() {
        errormessage = "";
      });
    }
  }

  bool _obscureText = true;

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  List cities = [];
  String? haveLicence;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1.5,
          child: Column(
            children: [
              SizedBox(
                  height: 300, child: Lottie.asset('assets/Animation.json')),
              Row(
                children: [
                  Spacer(),
                  Text(
                    "CREATE\t\t",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 25, color: Colors.black),
                  ),
                  Text(
                    "DELIVERY",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 25, color: Colors.red),
                  ),
                  Text(
                    "\t\tACCOUNT",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 25, color: Colors.black),
                  ),
                  Spacer(),
                ],
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: name,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.abhayaLibre(color: Colors.black),
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "UserName",
                        hintText: "Enter your name",
                        hintStyle: GoogleFonts.abhayaLibre(color: Colors.black),
                        labelStyle:
                            GoogleFonts.abhayaLibre(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: phone,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.abhayaLibre(color: Colors.black),
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Phone Number",
                        hintText: "Enter your contact number",
                        hintStyle: GoogleFonts.abhayaLibre(color: Colors.black),
                        labelStyle:
                            GoogleFonts.abhayaLibre(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: city,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.abhayaLibre(color: Colors.black),
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: "Accessible cities",
                          hintText: "Enter Accessible cities",
                          hintStyle:
                              GoogleFonts.abhayaLibre(color: Colors.black),
                          labelStyle:
                              GoogleFonts.abhayaLibre(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                cities.add(city.text);
                                city.clear();
                              },
                              icon: Icon(Icons.add))),
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 100.0, right: 100.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: cities.isEmpty ? 1 : cities.length,
                          itemBuilder: (context, index) => cities.isEmpty
                              ? SizedBox(width: 10, height: 10)
                              : TextButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.black),
                                    alignment: Alignment.center,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      cities.removeAt(index);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    cities[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                  Text("Do you have Driving Licence ?"),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        value: haveLicence,
                        hint: Text("Do you have Driving Licence ?"),
                        items: ['yes', 'no'].map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            haveLicence = value;
                          });
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.abhayaLibre(color: Colors.black),
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Email",
                        hintText: "Enter email address",
                        hintStyle: GoogleFonts.abhayaLibre(color: Colors.black),
                        labelStyle:
                            GoogleFonts.abhayaLibre(color: Colors.black),
                        errorText: errormessage.isEmpty ? null : errormessage,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                      onChanged: validateEmail,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: pass,
                      obscureText: _obscureText,
                      keyboardType: TextInputType.visiblePassword,
                      style: GoogleFonts.abhayaLibre(color: Colors.black),
                      cursorColor: Colors.blueGrey,
                      decoration: InputDecoration(
                          focusColor: Colors.blueGrey,
                          labelText: "Password",
                          hintText: "Enter a strong password",
                          isDense: true,
                          hintStyle:
                              GoogleFonts.abhayaLibre(color: Colors.black),
                          labelStyle:
                              GoogleFonts.abhayaLibre(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black)),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: togglePasswordVisibility,
                          )),
                    ),
                  ),
                  // minheight,
                  // minheight,
                  ElevatedButton(
                    onPressed: () {
                      validateEmail(email.text);
                      if (errormessage.isEmpty) {
                        //signup();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signin(),
                          ));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        minimumSize: MaterialStateProperty.all(Size(200, 50))),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.abhayaLibre(
                          fontSize: 25, color: Colors.black),
                    ),
                  ),
                  // minheight,
                  // minheight,
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        "Already a User? ",
                        style: GoogleFonts.abhayaLibre(color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signin(),
                                ));
                          },
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.abhayaLibre(
                                color: Colors.lightBlueAccent, fontSize: 18),
                          )),
                      Spacer(),
                    ],
                  ),
                ],
              ),
              //  minheight,

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
