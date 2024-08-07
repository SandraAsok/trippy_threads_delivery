// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippy_threads_delivery/home/home.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
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

  Future signin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: pass.text);
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      preferences.setBool('user', true);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("something went wrong"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ok"))
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                    height: 300,
                    child: Lottie.asset('assets/signinanimation.json')),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "LOGIN\t\t",
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

                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    style: GoogleFonts.abhayaLibre(color: Colors.black),
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: "Email",
                      hintText: "Enter email address",
                      hintStyle: GoogleFonts.abhayaLibre(color: Colors.black),
                      labelStyle: GoogleFonts.abhayaLibre(color: Colors.black),
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
                //  minheight,
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
                        hintStyle: GoogleFonts.abhayaLibre(color: Colors.black),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 300),
                  child: TextButton(
                      onPressed: () {}, child: Text("forgot password ?")),
                ),
                // minheight,
                ElevatedButton(
                  onPressed: () {
                    validateEmail(email.text);
                    if (errormessage.isEmpty) {
                      signin();
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("supplied credential is incorrect"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("ok"))
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey),
                      minimumSize: MaterialStateProperty.all(Size(200, 50))),
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 25, color: Colors.black),
                  ),
                ),

                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
