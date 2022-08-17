import 'package:adminfirebas/AppRouter/AppRouter.dart';
import 'package:adminfirebas/models/Category.dart';
import 'package:adminfirebas/models/Product.dart';
import 'package:adminfirebas/providers/fireStoreProvider.dart';
import 'package:adminfirebas/views/screens/UpdateProductScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FullProduct extends StatefulWidget {
  Category category;
  Product product;
  FullProduct(this.category, this.product, {Key? key}) : super(key: key);

  @override
  State<FullProduct> createState() => _FullProductState();
}

class _FullProductState extends State<FullProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
                // AppRoute.PushWithReplacementToWidget(HomePage());
              },
              child: Container(
                child: Icon(Icons.arrow_circle_left_outlined),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    color: Colors.black),
              )),
          // automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Stack(children: [
          Container(
            height: 891.42.h,
            child: Column(
              children: [
                Container(
                  height: 450.h,
                  width: 411.w,
                  child: Image.network(
                    widget.product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: (891 - 450).h,
                )
              ],
            ),
          ),
          Positioned(
            top: 430,
            child: Container(
              height: 461.h,
              width: 411.4.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 25.w, top: 20.h, right: 15.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(widget.product.name,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))),
                        Spacer(),
                        Text("Quantity: ",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))),
                        Text(widget.product.quantity.toString(),
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold
                                    ))),
                        SizedBox(
                          width: 15.w,
                        )
                      ],
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.product.type,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)))),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Description",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)))),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.product.description,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.grey.shade400,
                            )))),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            children: [
                              Text(" Price",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.white))),
                              Text(" \$" + widget.product.price.toString(),
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                                          SizedBox(height: 5.h,)
                            ],
                          ),
                          Spacer(),
                          SizedBox(
                            width: 200.w,
                            height: 40.h,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all(
                                        const StadiumBorder(
                                            side: BorderSide()))),
                                onPressed: () {
                                  Provider.of<FireStoreProvider>(context,
                                          listen: false)
                                      .pushToUpdateScreen(
                                          widget.product, widget.category);
                                },
                                child: Text(
                                  "Edit Product",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                )),
                          ),
                          SizedBox(
                            width: 20.w,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
