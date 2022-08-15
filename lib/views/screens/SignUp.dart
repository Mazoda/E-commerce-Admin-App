import 'dart:developer';
import 'package:adminfirebas/providers/authProvider.dart';
import 'package:adminfirebas/views/widgets/custom_checkbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Form(
            key: Provider.of<AuthProvider>(context).registerKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Stack(
                  children: [
                    Text(
                      "Fashions",
                      style: GoogleFonts.sacramento(
                          textStyle: TextStyle(
                              fontSize: 60.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 70, top: 60),
                        child: Text(
                          "My life My Style",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          )),
                        )),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign Up ",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Create a new account ",
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "UserName ",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    TextFormField(
                        validator:
                            Provider.of<AuthProvider>(context, listen: false)
                                .userName,
                        controller:
                            Provider.of<AuthProvider>(context, listen: false)
                                .username),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    TextFormField(
                      validator:
                          Provider.of<AuthProvider>(context, listen: false)
                              .emailValidator,
                      controller:
                          Provider.of<AuthProvider>(context, listen: false)
                              .email,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    TextFormField(
                      validator:
                          Provider.of<AuthProvider>(context, listen: false)
                              .password,
                      controller:
                          Provider.of<AuthProvider>(context, listen: false)
                              .pass,
                      onSaved: (val) =>
                          Provider.of<AuthProvider>(context, listen: false)
                              .pass
                              .text !=
                          val,
                      obscureText:
                          Provider.of<AuthProvider>(context, listen: false)
                              .passwordVisible,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: Provider.of<AuthProvider>(context).toggle,
                          child:
                              Provider.of<AuthProvider>(context, listen: false)
                                      .passwordVisible
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm Password",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    TextFormField(
                      validator:
                          Provider.of<AuthProvider>(context, listen: false)
                              .confirmpass,
                      controller:
                          Provider.of<AuthProvider>(context, listen: false)
                              .confirmpassword,
                      onSaved: (val) =>
                          Provider.of<AuthProvider>(context, listen: false)
                              .confirmpassword
                              .text !=
                          val,
                      obscureText: Provider.of<AuthProvider>(
                        context,
                      ).confirmpasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: Provider.of<AuthProvider>(context).toggle2,
                          child: Provider.of<AuthProvider>(context)
                                  .confirmpasswordVisible
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomCheckbox(
                  validator: Provider.of<AuthProvider>(context, listen: false)
                      .checkBoxValidator,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 340.w,
                  height: 50.h,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (Provider.of<AuthProvider>(context, listen: false)
                            .registerKey
                            .currentState!
                            .validate()) {
                          Provider.of<AuthProvider>(context,listen: false).signUp(
                              Provider.of<AuthProvider>(context, listen: false)
                                  .email
                                  .text,
                              Provider.of<AuthProvider>(context, listen: false)
                                  .pass
                                  .text);
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape:
                              MaterialStateProperty.all(const StadiumBorder())),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
