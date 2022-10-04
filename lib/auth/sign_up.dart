import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:test_app/api/authApi.dart';

import '../component/textfild.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool activindex = false;
  bool isHidden = true;
  bool isHidden2 = true;
  String? Passwodmsg = "";

  String? Function(String?)? validator;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 6,
                ),
                Text("Sign up",
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 86, 90, 185),
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                      "Please enter your details beloew to\nsisn up now!",
                      style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 6,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(
                          () {
                            activindex = false;
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: activindex == false
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Families",
                            style: TextStyle(
                                color: activindex == false
                                    ? Colors.blue
                                    : Colors.black,

                                // fontFamily: font,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: (() {
                        setState(
                          () {
                            activindex = true;
                          },
                        );
                      }),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: activindex == true
                                    ? Colors.grey
                                    : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Providers",
                            style: TextStyle(
                                color: activindex == true
                                    ? Colors.blue
                                    : Colors.black,

                                // fontFamily: font,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 18,
                ),
                Center(
                  child: TextfileCom(
                    title: "First Name*",
                    controller: firstnameController,
                    border: Border.all(
                        color: firstnameController.text == null ||
                                firstnameController.text == ""
                            ? Colors.red
                            : Colors.black),
                  ),
                ),
                firstnameController.text == null ||
                        firstnameController.text == ""
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Please enter first name.",
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 14,
                                color: Colors.red)),
                      )
                    : Container(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                Center(
                  child: TextfileCom(
                    title: "Last Name",
                    controller: lastnameController,
                    border: Border.all(
                        color: lastnameController.text == null ||
                                lastnameController.text == ""
                            ? Colors.red
                            : Colors.black),
                  ),
                ),
                lastnameController.text == null || lastnameController.text == ""
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Please enter Last name.",
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 14,
                                color: Colors.red)),
                      )
                    : Container(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                Center(
                  child: Container(
                    // padding: EdgeInsets.all(20),
                    // height: 160,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(.1),
                      border: Border.all(
                          color: emailController.text == null ||
                                  emailController.text == ""
                              ? Colors.red
                              : Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 233, 230, 230)
                              .withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          validator: validator,
                          //  (valueofEmail) =>
                          //     EmailValidator.validate(emailController.text)
                          //         ? null
                          //         : " Please enter a valid email",
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: "Email Addres *",
                              hintStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Text(
                        "${EmailValidator.validate(emailController.text) ? "" : "Please enter a valid email addres."}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            letterSpacing: 2, fontSize: 14, color: Colors.red)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                Center(
                  child: Container(
                      // padding: EdgeInsets.all(20),
                      // height: 160,
                      width: MediaQuery.of(context).size.width - 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(.1),
                        border: Border.all(
                            color: passwordController.text == null ||
                                    passwordController.text == ""
                                ? Colors.red
                                : Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 233, 230, 230)
                                .withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: isHidden == true ? true : false,
                            enableSuggestions: false,
                            autocorrect: false,
                            onChanged: (v) => formKey.currentState?.validate(),
                            validator: (v) {
                              String? message;
                              if (!RegExp(".*[0-9].*").hasMatch(v ?? '')) {
                                message ??= '';
                                message +=
                                    'Input should contain a numeric value 1-9. ';
                              }
                              if (!RegExp('.*[a-z].*').hasMatch(v ?? '')) {
                                message ??= '';
                                message +=
                                    'Input should contain a lowercase letter a-z. ';
                              }
                              if (!RegExp('.*[A-Z].*').hasMatch(v ?? '')) {
                                message ??= '';
                                message +=
                                    'Input should contain an uppercase letter A-Z. ';
                              }
                              if (!RegExp('.*[*,@,&,*,\$,!].*')
                                  .hasMatch(v ?? '')) {
                                message ??= '';
                                message +=
                                    'Input should contain an special chracter @,!,*. ';
                              }
                              Passwodmsg = message;
                            },
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () {
                                      if (isHidden == true) {
                                        setState(() {
                                          isHidden = false;
                                        });
                                      } else {
                                        setState(() {
                                          isHidden = true;
                                        });
                                      }
                                    },
                                    child: isHidden == true
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: isHidden == true
                                                ? Colors.grey
                                                : Colors.blue,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: isHidden == true
                                                ? Colors.grey
                                                : Colors.blue,
                                          )),
                                counterText: "",
                                hintText: "Password*",
                                hintStyle: TextStyle(
                                    fontSize: 12,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w700),
                                border: InputBorder.none),
                          ),
                        ),
                      )),
                ),
                Passwodmsg == null || Passwodmsg == ""
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(Passwodmsg.toString(),
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 14,
                                color: Colors.red)),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                Center(
                  child: Container(
                      // padding: EdgeInsets.all(20),
                      // height: 160,
                      width: MediaQuery.of(context).size.width - 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(.1),
                        border: Border.all(
                            color: confirmPasswordController.text == null ||
                                    confirmPasswordController.text == ""
                                ? Colors.red
                                : Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 233, 230, 230)
                                .withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: confirmPasswordController,
                          obscureText: isHidden2 == true ? true : false,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  onTap: () {
                                    if (isHidden2 == true) {
                                      setState(() {
                                        isHidden2 = false;
                                      });
                                    } else {
                                      setState(() {
                                        isHidden2 = true;
                                      });
                                    }
                                  },
                                  child: isHidden2 == true
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: isHidden2 == true
                                              ? Colors.grey
                                              : Colors.blue,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: isHidden2 == true
                                              ? Colors.grey
                                              : Colors.blue,
                                        )),
                              counterText: "",
                              hintText: "Confirm Password*",
                              hintStyle: TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w700),
                              border: InputBorder.none),
                        ),
                      )),
                ),
                passwordController.text != confirmPasswordController.text
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Please entered don't match.",
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 14,
                                color: Colors.red)),
                      )
                    : Container(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 15,
                ),
                Row(
                  children: [
                    Container(
                      // padding: EdgeInsets.all(20),
                      // height: 160,
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(.1),
                        border: Border.all(color: Colors.blue),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 233, 230, 230)
                                .withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(child: Text("*")),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text("  indicates Mandatory Fields",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue)),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                InkWell(
                  onTap: () async {
                    Map data = await authApi.doLogin(
                        activindex == true ? "Provider" : "Families",
                        firstnameController.text,
                        lastnameController.text,
                        emailController.text,
                        "India",
                        mobileController.text,
                        passwordController.text);
                    Navigator.pushReplacementNamed(context, "/homepage");
                    return;
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    // height: 160,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                            0.1,
                            0.2,
                            0.5,
                            0.9
                          ],
                          colors: [
                            Color.fromARGB(255, 73, 89, 182),
                            Color.fromARGB(255, 58, 93, 210),
                            Color.fromARGB(255, 81, 83, 215),
                            Color.fromARGB(255, 81, 83, 215),
                          ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text("Sign up",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account? ",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text("Sign in",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 12,
                ),
              ]),
        ),
      ),
    );
  }
}
