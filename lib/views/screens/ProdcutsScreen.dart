import 'package:adminfirebas/AppRouter/AppRouter.dart';
import 'package:adminfirebas/models/Category.dart';
import 'package:adminfirebas/models/Product.dart';
import 'package:adminfirebas/providers/fireStoreProvider.dart';
import 'package:adminfirebas/views/screens/addNewProduct.dart';
import 'package:adminfirebas/views/widgets/ProductWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  List<Product> products;
  Category category;
  ProductsScreen(this.products, this.category);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.category.name + " Products",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        child: Column(
          children: [
            Container(
                height: 780.h,
                child: Provider.of<FireStoreProvider>(context).products == null
                    ? Lottie.asset('assets/images/empty.json')
                    : GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: (0.66),
                        mainAxisSpacing: 10,
                        children: List.generate(
                            widget.products.length + 1,
                            (index) => index == widget.products.length
                                ? InkWell(
                                    onTap: () {
                                      AppRoute.PushWithReplacementToWidget(
                                          addNewProduct(widget.category));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 8),
                                          width: 200.w,
                                          height: 200.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                width: 2, color: Colors.black),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.add_box_rounded),
                                              Text("Add Product",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 88.h,
                                        )
                                      ],
                                    ),
                                  )
                                : ProductWidget(widget.products[index],
                                    widget.category)).reversed.toList())),
            SizedBox(height: 0.h),
          ],
        ),
      ),
    );
  }
}
