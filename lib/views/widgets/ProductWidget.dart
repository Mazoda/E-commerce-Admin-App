import 'dart:developer';

import 'package:adminfirebas/AppRouter/AppRouter.dart';
import 'package:adminfirebas/models/Category.dart';
import 'package:adminfirebas/models/Product.dart';
import 'package:adminfirebas/providers/fireStoreProvider.dart';
import 'package:adminfirebas/views/screens/FullProduct.dart';
import 'package:adminfirebas/views/screens/ProdcutsScreen.dart';
import 'package:adminfirebas/views/screens/UpdateCategoryScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  Category category;

  ProductWidget(this.product, this.category);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Delete"),
                content: Text("Are you sure you want to delete the product"),
                actions: [
                  MaterialButton(
                    onPressed: () {
                      Provider.of<FireStoreProvider>(context, listen: false)
                          .deleteProduct(product, category);
                    },
                    child: Text("Yes"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No"),
                  )
                ],
              );
            });
      },
      onTap: () {
        AppRoute.PushToWidget(FullProduct(category, product));
      },
      child: Container(
        height: 600.h,
        width: 200.w,
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2, color: Colors.black),
                  image: DecorationImage(
                      image: NetworkImage(product.image), fit: BoxFit.cover),
                )),
            SizedBox(
              height: 4.h,
            ),
            Text(product.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
            Text(product.type,
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.poppins(fontSize: 15.sp, color: Colors.grey)),
            Text("\$" + product.price.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
          ],
        ),
      ),
    );
  }
}
