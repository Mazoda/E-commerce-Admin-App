import 'dart:developer';

import 'package:adminfirebas/AppRouter/AppRouter.dart';
import 'package:adminfirebas/models/Category.dart';
import 'package:adminfirebas/providers/fireStoreProvider.dart';
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

class CatWidget extends StatelessWidget {
  Category category;
  int index;
  CatWidget(this.category, this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.w, top: 20.h),
      child: Column(
        children: [
          Slidable(
            startActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    Provider.of<FireStoreProvider>(context, listen: false)
                        .deleteCategory(category);
                  },
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: "Delete",
                  spacing: 10.h,
                  borderRadius: BorderRadius.circular(20),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SlidableAction(
                  onPressed: (context) {
                    Provider.of<FireStoreProvider>(context, listen: false)
                        .categoryNameControllor
                        .text = category.name;
                    AppRoute.PushToWidget(UpdateCat(category));
                  },
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.replay_circle_filled_outlined,
                  borderRadius: BorderRadius.circular(20),
                  label: 'Update',
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                Provider.of<FireStoreProvider>(context, listen: false)
                    .getAllProducts(category);
              },
              child: Container(
                width: 340.w,
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2, color: Colors.black),
                  image: DecorationImage(
                      image: NetworkImage(category.imageUrl),
                      fit: BoxFit.cover),
                ),
                child: Align(
                  alignment: index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Column(
                    children: [
                      Container(
                        margin: index % 2 == 0
                            ? EdgeInsets.only(top: 50.h, left: 20.w)
                            : EdgeInsets.only(top: 50.h, right: 20.w),
                        child: Text(category.name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 35.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                      // Text(
                      //     Provider.of<FireStoreProvider>(context, listen: false)
                      //         .counter
                      //         .toString()+" Products",
                      //     textAlign: TextAlign.left,
                      //     style: GoogleFonts.poppins(
                      //       fontSize: 20.sp,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white,
                      //     ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
