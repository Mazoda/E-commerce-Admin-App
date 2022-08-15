import 'dart:async';
import 'package:adminfirebas/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  navigatFun() async {
    await Future.delayed(Duration(seconds: 3));
    // print(Provider.of<AuthProvider>(context, listen: false));
    // ignore: use_build_context_synchronously
    Provider.of<AuthProvider>(context, listen: false).checkUser();
// AppRoute.NavigateWithReplacementToWidget(FirstScreen());
  }

  @override
  Widget build(BuildContext context) {
    navigatFun();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splash2.jpeg"),
            fit: BoxFit.cover,
            // opacity: .9,
          ),
        ),
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fashions",
              style: GoogleFonts.sacramento(
                  textStyle: TextStyle(
                      fontSize: 100.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )
          ],
        )),
      ),
    );
  }
}
