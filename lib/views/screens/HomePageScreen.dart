// ignore: file_names
import 'package:adminfirebas/AppRouter/AppRouter.dart';
import 'package:adminfirebas/data/auth_Helper.dart';
import 'package:adminfirebas/providers/authProvider.dart';
import 'package:adminfirebas/providers/fireStoreProvider.dart';
import 'package:adminfirebas/views/screens/AddNewCategory.dart';
import 'package:adminfirebas/views/widgets/CategoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          ElevatedButton(
              onPressed: () async {
                await Provider.of<AuthProvider>(context, listen: false)
                    .signOut();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              child: Icon(Icons.exit_to_app))
        ],
        title: Text(
          "Categories",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            activeColor: Colors.white,
            color: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: EdgeInsets.all(8),

            tabs: const [
              GButton(
                icon: Icons.home,
                gap: 8,
                text: "Home",
              ),
              GButton(
                icon: Icons.person,
                gap: 8,
                text: "Profile",
              )
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40.h, left: 10.w),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                children: [
                  Container(
                      // padding: EdgeInsets.only(bottom: 30.h),
                      height: 559.h,
                      child: Provider.of<FireStoreProvider>(context)
                                  .categories ==
                              null
                          ? Lottie.asset('assets/images/empty.json')
                          : ListView.builder(
                              itemCount: Provider.of<FireStoreProvider>(context)
                                  .categories
                                  .length,
                              itemBuilder: (context, index) {
                                return CatWidget(
                                    Provider.of<FireStoreProvider>(context)
                                        .categories[index],
                                    index);
                              })),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 350.w,
                    height: 80.h,
                    child: ElevatedButton(
                        onPressed: () {
                          print(Provider.of<FireStoreProvider>(context,
                                  listen: false)
                              .categories);
                          AppRoute.PushToWidget(AddCat());
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(StadiumBorder())),
                        child: Text(
                          "Add New Category",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )),
                  ),
                ],
              ),
            )),
      ),
    );
    //   return Provider.of<FireStoreHelper>(context).getAllCategories?
    //  Lottie.asset('assets/animations/empty.json') : ListView.builder(
    //         itemCount: cat.length, itemBuilder: (context, index) {

    //         });
  }
}
