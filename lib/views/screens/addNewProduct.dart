import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:adminfirebas/data/fireStore_Helper.dart';
import 'package:adminfirebas/data/storage_Helper.dart';
import 'package:adminfirebas/models/Category.dart';
import 'package:adminfirebas/models/Product.dart';
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

class addNewProduct extends StatefulWidget {
  Category cat;
  addNewProduct(this.cat);
  @override
  State<addNewProduct> createState() => _addNewProductState();
}

class _addNewProductState extends State<addNewProduct> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> procutKey = GlobalKey();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Add Product",
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
      //   decoration: const BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
      //       // onTabChange: (index) {
      //       //   switch (index) {
      //       //     case 0:
      //       //       AppRoute.PushToWidget(HomePage());
      //       //       break;
      //       //     case 1:
      //       //       AppRoute.PushToWidget(widget);
      //       //       break;
      //       //     case 2:
      //       //       AppRoute.PushToWidget(widget);
      //       //       break;
      //       //     case 3:
      //       //       AppRoute.PushToWidget(widget);
      //       //       break;
      //       //   }
      //       // },
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: procutKey,
          child: Center(
            child: Container(
              margin: EdgeInsets.only(left: 10.w, top: 20.h,right: 10.w),
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
                    height: 50.h,
                  ),
                  Text(
                    "Product Name",
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),

                  TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator:
                          Provider.of<FireStoreProvider>(context, listen: false)
                              .CatNamee,
                      controller:
                          Provider.of<FireStoreProvider>(context, listen: false)
                              .productNameControllor),

                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Product Type",
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),

                  TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator:
                          Provider.of<FireStoreProvider>(context, listen: false)
                              .type,
                      controller:
                          Provider.of<FireStoreProvider>(context, listen: false)
                              .producttypeControllor),

                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Product Description",
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  // CustomTextfield(
                  //     validator:
                  //         Provider.of<FireStoreProvider>(context, listen: false)
                  //             .desc,
                  //     controller:
                  //         Provider.of<FireStoreProvider>(context, listen: false)
                  //             .productDesControllor),
                  TextFormField(
                    maxLines: 5,
                    validator:
                        Provider.of<FireStoreProvider>(context, listen: false)
                            .desc,
                    controller:
                        Provider.of<FireStoreProvider>(context, listen: false)
                            .productDesControllor,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),

                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Product Price",
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),

                  TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator:
                          Provider.of<FireStoreProvider>(context, listen: false)
                              .QuanPrice,
                      keyboardType: TextInputType.number,
                      controller:
                          Provider.of<FireStoreProvider>(context, listen: false)
                              .productPriceControllor),

                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Product Quantity",
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),

                  TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator:
                          Provider.of<FireStoreProvider>(context, listen: false)
                              .QuanPrice,
                      keyboardType: TextInputType.number,
                      controller:
                          Provider.of<FireStoreProvider>(context, listen: false)
                              .productQuantitiyControllor),

                  SizedBox(
                    height: 30.h,
                  ),

                  SizedBox(
                    width: 320.w,
                    height: 50.h,
                    child: ElevatedButton(
                        onPressed: () {
                          Provider.of<FireStoreProvider>(context, listen: false)
                              .addNewProduct(widget.cat, procutKey);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(StadiumBorder())),
                        child: Text(
                          "Add Product",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  // CustomTextfield(
                  //     title: "Category Name",
                  //     validator: Provider.of<AuthProvider>(context, listen: false)
                  //         .userName,
                  //     controller: Provider.of<AuthProvider>(context, listen: false)
                  //         .username)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
