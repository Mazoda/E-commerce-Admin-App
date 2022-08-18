import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:adminfirebas/data/fireStore_Helper.dart';
import 'package:adminfirebas/data/storage_Helper.dart';
import 'package:adminfirebas/providers/authProvider.dart';
import 'package:adminfirebas/providers/fireStoreProvider.dart';
import 'package:adminfirebas/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddCat extends StatefulWidget {
  const AddCat({Key? key}) : super(key: key);

  @override
  State<AddCat> createState() => _AddCatState();
}

class _AddCatState extends State<AddCat> {
  @override
  Widget build(BuildContext context) {
    Provider.of<FireStoreProvider>(context).categoryNameControllor.clear();
    GlobalKey<FormState> category = GlobalKey();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Add Category",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        // automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Form(
        key: category,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(left: 10.w, top: 20.h),
            child: Column(
              children: [
                Provider.of<FireStoreProvider>(context).selectedImage == null
                    ? InkWell(
                        onTap: () async {
                          await Provider.of<FireStoreProvider>(context,
                                  listen: false)
                              .selectImage();
                        },
                        child: Container(
                          width: 300.w,
                          height: 300.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 130.h, left: 50.w),
                            child: Text(
                              "Tap to add Image",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () async {
                          await Provider.of<FireStoreProvider>(context,
                                  listen: false)
                              .selectImage();
                        },
                        child: Container(
                            width: 350.w,
                            height: 200.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: FileImage(
                                      Provider.of<FireStoreProvider>(context)
                                          .selectedImage!),
                                  fit: BoxFit.cover),
                            )),
                      ),
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  "Category Name",
                  style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),

                TextFormField(
                    validator:
                        Provider.of<FireStoreProvider>(context, listen: false)
                            .CatNamee,
                    controller:
                        Provider.of<FireStoreProvider>(context, listen: false)
                            .categoryNameControllor),

                SizedBox(
                  height: 150.h,
                ),

                SizedBox(
                  width: 320.w,
                  height: 50.h,
                  child: ElevatedButton(
                      onPressed: () async {
                        Provider.of<FireStoreProvider>(context, listen: false)
                            .addNewCategory(category);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: Text(
                        "Add Category",
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
