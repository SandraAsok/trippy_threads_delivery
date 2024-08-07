// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, empty_catches, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippy_threads_delivery/authentication/signin.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
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
  String? haveVehicle;
  String licence = "";
  String filename = "";

  Future Createdeliveryuser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: pass.text);
      await FirebaseFirestore.instance.collection('employees_delivery').add({
        'name': name.text,
        'age': age.text,
        'phone': phone.text,
        'cities': cities,
        'vehicle': haveLicence,
        'licence': licence,
        'email': email.text,
      });
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      preferences.setBool('user', true);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Signin(),
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 2,
          child: Column(
            children: [
              SizedBox(
                  height: 300, child: Lottie.asset('assets/Animation.json')),
              Row(
                children: [
                  Spacer(),
                  Text(
                    "Already a User? ",
                    style: GoogleFonts.abhayaLibre(
                        color: Colors.black, fontSize: 18),
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
                            color: Colors.blueAccent, fontSize: 20),
                      )),
                  Spacer(),
                ],
              ),
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
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      controller: name,
                      keyboardType: TextInputType.name,
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
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      controller: age,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.abhayaLibre(color: Colors.black),
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Age",
                        hintText: "Enter your age",
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
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      controller: phone,
                      keyboardType: TextInputType.phone,
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
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      controller: city,
                      keyboardType: TextInputType.streetAddress,
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
                                cities.add(city.text.toLowerCase());
                                city.clear();
                              },
                              icon: Icon(Icons.add))),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 100.0, right: 100.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: cities.isEmpty ? 1 : cities.length,
                          itemBuilder: (context, index) => cities.isEmpty
                              ? SizedBox(width: 10, height: 10)
                              : TextButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.blueGrey),
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
                  Row(
                    children: [
                      SizedBox(width: 30),
                      Text(
                        "Do you have own vehicle ?",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(15.0),
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
                        value: haveVehicle,
                        hint: Text("Do you have own Vehicle ?"),
                        items: ['yes', 'no'].map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            haveVehicle = value;
                          });
                        },
                      )),
                  Row(
                    children: [
                      SizedBox(width: 30),
                      Text(
                        "Do you have Driving Licence ?",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(15.0),
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
                    padding: EdgeInsets.all(10.0),
                    child: haveLicence == 'yes'
                        ? GestureDetector(
                            onTap: () async {
                              final pickedfile = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (pickedfile == null) {
                                return;
                              } else {
                                File file = File(pickedfile.path);
                                licence = await uploadLicence(file, name.text);
                                filename = file.path.split('/').last;
                                setState(() async {});
                              }
                            },
                            child: licence == ""
                                ? Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Center(
                                        child:
                                            Text("submit your licence here !")),
                                  )
                                : Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Center(child: Text(filename)),
                                  ),
                          )
                        : SizedBox(
                            height: 20,
                            child: Text(
                              "You can't be a delivery boy without driving licence",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
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
                    padding: EdgeInsets.all(15.0),
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
                  ElevatedButton(
                    onPressed: haveLicence == 'no'
                        ? null
                        : () {
                            validateEmail(email.text);
                            if (errormessage.isEmpty) {
                              Createdeliveryuser();
                            }
                          },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> status) {
                          if (status.contains(MaterialState.disabled)) {
                            return Colors.white;
                          }
                          return Colors.blueGrey;
                        }),
                        minimumSize: MaterialStateProperty.all(Size(200, 50))),
                    child: Text(
                      haveLicence == "yes" ? "Sign Up" : "Disabled",
                      style: GoogleFonts.abhayaLibre(
                          fontSize: 25, color: Colors.black),
                    ),
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

  Future<String> uploadLicence(File file, String username) async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    firebase_storage.Reference ref = storage.ref().child('licences/$username');
    firebase_storage.UploadTask task = ref.putFile(file);
    await task;
    String url = await ref.getDownloadURL();

    setState(() {
      licence = url;
    });
    return licence;
  }
}
