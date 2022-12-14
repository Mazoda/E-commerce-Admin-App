import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:adminfirebas/data/fireStore_Helper.dart';
import 'package:adminfirebas/data/storage_Helper.dart';
import 'package:adminfirebas/models/Category.dart';
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

class UpdateCat extends StatefulWidget {
  Category category;
  UpdateCat(this.category, {Key? key}) : super(key: key);

  @override
  State<UpdateCat> createState() => _UpdateCatState();
}

class _UpdateCatState extends State<UpdateCat> {
  Category? newcategory;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> categoryKey = GlobalKey();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Edit Category",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        // automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(30),
      //     color: Colors.black,
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //     child: GNav(
      //       backgroundColor: Colors.black,
      //       activeColor: Colors.white,
      //       color: Colors.white,
      //       tabBackgroundColor: Colors.grey.shade800,
      //       padding: EdgeInsets.all(8),
      //       tabs: const [
      //         GButton(
      //           icon: Icons.home,
      //           gap: 8,
      //           text: "Home",
      //         ),
      //         GButton(
      //           icon: Icons.shopping_cart,
      //           gap: 8,
      //           text: "cart",
      //         ),
      //         GButton(
      //           icon: Icons.notifications,
      //           gap: 8,
      //           text: "Notification",
      //         ),
      //         GButton(
      //           icon: Icons.person,
      //           gap: 8,
      //           text: "Profile",
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Form(
        key: categoryKey,
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
                          height: 200.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: NetworkImage(widget.category.imageUrl),
                                  fit: BoxFit.cover)),
                          child: Container(
                            margin: EdgeInsets.only(top: 80.h, left: 40.w),
                            child: Text(
                              "Tap to Update Image",
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
                          width: 300.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: FileImage(
                                      Provider.of<FireStoreProvider>(context)
                                          .selectedImage!),
                                  fit: BoxFit.cover)),
                          child: Container(
                            margin: EdgeInsets.only(top: 80.h, left: 40.w),
                            child: Text(
                              "Tap to Update Image",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
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
                          .categoryNameControllor,
                  // initialValue: widget.category.name,
                ),
                SizedBox(
                  height: 150.h,
                ),
                SizedBox(
                  width: 320.w,
                  height: 50.h,
                  child: ElevatedButton(
                      onPressed: () async {
                      await  Provider.of<FireStoreProvider>(context, listen: false)
                            .updateCategory(widget.category);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: Text(
                        "Update Category",
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
