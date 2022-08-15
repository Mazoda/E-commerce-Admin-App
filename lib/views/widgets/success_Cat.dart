import 'package:adminfirebas/AppRouter/AppRouter.dart';
import 'package:adminfirebas/views/screens/HomePageScreen.dart';
import 'package:adminfirebas/views/screens/LoginScreen.dart';
import 'package:adminfirebas/views/screens/ProdcutsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessfulCat extends StatelessWidget {
  String title;

  SuccessfulCat(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 300.h,
          ),
          Image.asset(
            "assets/images/success.png",
            width: 40,
            height: 40,
          ),
          Text(
            "Successful!",
            style: GoogleFonts.poppins(
                fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 280.w,
            child: Text(title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  color: Colors.grey,
                )),
          ),
          SizedBox(
            height: 250.h,
          ),
          SizedBox(
            width: 340.w,
            height: 50.h,
            child: ElevatedButton(
                onPressed: () {
          
                  AppRoute.PushWithReplacementToWidget(HomePage());
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: Text(
                  "Go back to categories",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                )),
          ),
        ]),
      ),
    );
  }
}
