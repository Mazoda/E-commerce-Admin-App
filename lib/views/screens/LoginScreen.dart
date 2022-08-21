import 'dart:developer';
import 'package:adminfirebas/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:string_validator/string_validator.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Form(
            key: Provider.of<AuthProvider>(context).loginkey,
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
                        "Welcome ! ",
                        style: GoogleFonts.poppins(
                            fontSize: 22.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "please login to continue",
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
                  height: 50.h,
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
                          Provider.of<AuthProvider>(context).passwordVisible,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: Provider.of<AuthProvider>(
                            context,
                          ).toggle,
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
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Provider.of<AuthProvider>(context).error,
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 340.w,
                  height: 50.h,
                  child: ElevatedButton(
                      onPressed: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .signIn(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .email
                                    .text,
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .pass
                                    .text,
                                context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 2.h,
                      width: 180.w,
                      color: Colors.grey,
                    ),
                    Text("or", style: GoogleFonts.poppins(fontSize: 20.sp)),
                    Container(
                      height: 2.h,
                      width: 180.w,
                      color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 340.w,
                  height: 50.h,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue.shade900),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          const CircleAvatar(
                            radius: 10,
                            backgroundImage:
                                AssetImage("assets/images/facebook.png"),
                          ),
                          Text(
                            "  Continue with Facebook",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 340.w,
                  height: 50.h,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          Image.asset(
                            "assets/images/google.png",
                            width: 24.w,
                            height: 24.h,
                          ),
                          Text(
                            "  Continue with Google",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 340.w,
                  height: 50.h,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          Image.asset(
                            "assets/images/Apple.png",
                            width: 24.w,
                            height: 24.h,
                          ),
                          Text(
                            "  Continue with Apple",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
