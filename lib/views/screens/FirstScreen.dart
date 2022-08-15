import 'dart:async';

import 'package:adminfirebas/AppRouter/AppRouter.dart';
import 'package:adminfirebas/views/screens/LoginScreen.dart';
import 'package:adminfirebas/views/screens/SignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  // void initState() {
  //   super.initState();

  //   Timer(

  //       Duration(seconds: 3),
  //       () => Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => RegisterScreen())));

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splash.jpeg"),
            fit: BoxFit.cover,
            // opacity: 0.9,
            // alignment :Alignment.centerLeft,
           
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 350.w,
              height: 50.h,
              child: ElevatedButton(
                  onPressed: () {
                    AppRoute.PushToWidget(LoginScreen());
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 350.w,
              height: 50.h,
              child: OutlinedButton(
                  onPressed: () async {
                    AppRoute.PushToWidget(SignUpScreen());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: StadiumBorder(),
                    side: BorderSide(width: 3, color: Colors.white),
                  ),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  )),
            ),
            SizedBox(
              height: 100.h,
            )
          ],
        )),
      ),
    );
  }
}
